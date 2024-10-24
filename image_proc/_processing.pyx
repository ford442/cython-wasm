
import numpy as np
cimport numpy as np
from skimage import exposure, transform
from skimage.filters import unsharp_mask
import cv2

cpdef np.ndarray[np.uint8_t, ndim=3] process_hist(np.ndarray[np.uint8_t, ndim=3] tile):
    cdef np.ndarray[np.float32_t, ndim=3] img2
    img2 = exposure.equalize_hist(tile).astype(np.float32)
    return img2

cpdef np.ndarray[np.uint8_t, ndim=3] process_tile(np.ndarray[np.uint8_t, ndim=3] tile):
    cdef int rows, cols
    cdef np.ndarray[np.float32_t, ndim=2] input_pts, output_pts,
    cdef np.ndarray[np.float64_t, ndim=2] M
    cdef np.ndarray[np.float32_t, ndim=2] N
    cdef np.ndarray[np.float32_t, ndim=3] processed_tile
    cdef np.ndarray[np.float32_t, ndim=3] dst, tile2,resize4x, result_1
    rows, cols = tile.shape[:2]
    input_pts = np.array([[0,0], [cols-1,0], [0,rows-1]], dtype=np.float32)
    output_pts = np.array([[cols-1,0], [0,0], [cols-1,rows-1]], dtype=np.float32)
    M = cv2.getAffineTransform(input_pts, output_pts)
    N = M.astype(np.float32)
    tile2 = tile.astype(np.float32)
    #del tile
    dst = cv2.warpAffine(tile2, N, (cols,rows))
    del tile2
    resize4x = transform.rescale(dst, 2)
    del dst
    result_1 = unsharp_mask(resize4x, radius=1, amount=1)
    del resize4x
    processed_tile = transform.pyramid_reduce(result_1, 2)
    del result_1
    return tile
