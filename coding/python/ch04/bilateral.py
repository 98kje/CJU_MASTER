import sys
import numpy as np
import cv2

src = cv2.imread('/home/kimjaen/CJU_MASTER/coding/python/ch04/lenna.bmp')

if src is None:
    print('Image load failed!')
    sys.exit()

dst = cv2.bilateralFilter(src, -1, 10, 5)

cv2.imshow('src', src)
cv2.imshow('dst', dst)
cv2.waitKey()

cv2.destroyAllWindows()
