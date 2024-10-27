
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
    cdef np.ndarray[np.float32_t, ndim=3] dst
    rows, cols = tile.shape[:2]
    input_pts = np.array([[0,0], [cols-1,0], [0,rows-1]], dtype=np.float32)
    output_pts = np.array([[cols-1,0], [0,0], [cols-1,rows-1]], dtype=np.float32)
    M = cv2.getAffineTransform(input_pts, output_pts)
    N = M.astype(np.float32)
    tile2 = tile.astype(np.float32)
    del tile
    dst = cv2.warpAffine(tile2, N, (cols,rows))
    return dst

cpdef np.ndarray[np.uint8_t, ndim=3] process_tile2(np.ndarray[np.float32_t, ndim=3] tile3):
    cdef np.ndarray[np.float32_t, ndim=3] img_eq
    img_eq: np.ndarray = exposure.equalize_hist(tile3)
    return img_eq

cpdef np.ndarray[np.uint8_t, ndim=3] process_tile3(np.ndarray[np.float32_t, ndim=3] tile4):
    cdef np.ndarray[np.float32_t, ndim=3] resize4x
    resize4x: np.ndarray = transform.rescale(tile4, 2)
    return resize4x
