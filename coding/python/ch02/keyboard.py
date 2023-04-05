import sys
import numpy as np
import cv2


img = cv2.imread('cat.bmp', cv2.IMREAD_GRAYSCALE)

if img is None:
    print('Image load failed!')
    sys.exit()

cv2.namedWindow('image')
cv2.imshow('image', img)

while True:
    keycode = cv2.waitKey() #변수로 받아서 27 ord 이렇게 받아야 하나씩 눌렀을때 변환 가능.
    if keycode == ord('i') or keycode == ord('I'): #i누르면 영상 반전시키기.
        img = ~img
        cv2.imshow('image', img) # 이렇게 출력시켜야 가능함.
    elif keycode == 27:#27일때 즉 ESC 누르면 강제종료.
        break

cv2.destroyAllWindows()
