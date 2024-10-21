
import numpy as np
cimport numpy as np 

cpdef np.ndarray[np.uint8_t, ndim=2] process_tile(np.ndarray[np.uint8_t, ndim=2] tile):
    cdef int rows, cols
    cdef np.ndarray[np.float32_t, ndim=2] input_pts, output_pts
    cdef np.ndarray[np.float32_t, ndim=2] M 
    cdef np.ndarray[np.float32_t, ndim=2] dst
    cdef np.ndarray[np.float32_t, ndim=2] img_eq
    cdef np.ndarray[np.float32_t, ndim=2] resize4x
    cdef np.ndarray[np.float32_t, ndim=2] result_1
    cdef np.ndarray[np.float32_t, ndim=2] processed_tile
    M = cv2.getAffineTransform(input_pts , output_pts)
    dst = cv2.warpAffine(tile, M, (cols,rows))
    img_eq: np.ndarray = exposure.equalize_hist(dst)
    del dst
    resize4x: np.ndarray = transform.rescale(tile, 2)
    del tile
    result_1: np.ndarray = unsharp_mask(resize4x, radius=1, amount=1)
    del resize4x
    processed_tile: np.ndarray = transform.pyramid_reduce(result_1,2)
    del result_1
    return processed_tile
