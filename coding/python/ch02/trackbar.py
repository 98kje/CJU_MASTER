import numpy as np
import cv2


def on_level_change(pos):  #위치값 
    value = pos * 16
    if value >= 255:
        value = 255

    img[:] = value
    cv2.imshow('image', img)

#def on_level_change(pos): 
    #global img
    ##level = pos * 10
    #img[: , :] = pos * 16   255보다 커지면 강제로 255보다 크게 세팅해줘야함
    ## if level >= 255:
          #level = 255
    ##img[:, :] = level

    #cv2.imshow('image',img)
    ########
    #level = pos * 16
#혹은 np.clip(level, 0. 255)
#img[:, :] = level
#cv2.imshow ('image',img)

img = np.zeros((480, 640), np.uint8) #gray scale 호ㅏ면 제작 제로이니까 검은색
cv2.namedWindow('image')
cv2.createTrackbar('level', 'image', 0, 16, on_level_change) # 16씩 증가하도록 초기 0 최대 16

cv2.imshow('image', img)
cv2.waitKey()
cv2.destroyAllWindows()
