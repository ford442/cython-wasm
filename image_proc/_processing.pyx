
import numpy as np
cimport numpy as np
from skimage import exposure, transform
from skimage.filters import unsharp_mask
import cv2

cpdef np.ndarray[np.uint8_t, ndim=3] process_tile(np.ndarray[np.uint8_t, ndim=3] tile):
    cdef int rows, cols
    cdef np.ndarray[np.float32_t, ndim=2] input_pts, output_pts,
    cdef np.ndarray[np.float64_t, ndim=2] M
    cdef np.ndarray[np.float32_t, ndim=2] N
    cdef np.ndarray[np.float32_t, ndim=3] dst, img_eq, resize4x, result_1, processed_tile
    rows, cols = tile.shape[:2]
    input_pts = np.array([[0,0], [cols-1,0], [0,rows-1]], dtype=np.float32)
    output_pts = np.array([[cols-1,0], [0,0], [cols-1,rows-1]], dtype=np.float32)
    M = cv2.getAffineTransform(input_pts, output_pts)
    N = M.astype(np.float32)
    dst = cv2.warpAffine(tile, N, (cols,rows))
    img_eq = exposure.equalize_hist(dst)
    resize4x = transform.rescale(tile, 2)
    result_1 = unsharp_mask(resize4x, radius=1, amount=1)
    processed_tile = transform.pyramid_reduce(result_1, 2)
    return processed_tile
