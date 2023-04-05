import sys
import numpy as np
import cv2


oldx = oldy = -1

def on_mouse(event, x, y, flags, param):  #함수 제작 5개의 파라미터 무조건 적어줘야함.
    global oldx, oldy ,newx, newy

    if event == cv2.EVENT_LBUTTONDOWN:
        oldx, oldy = x, y
        print('EVENT_LBUTTONDOWN: %d, %d' % (x, y))
        # print('EVENT_LBUTTONDOWN: {}, {}' . format(x , y))
    elif event == cv2.EVENT_MBUTTONDOWN:
        newx, newy = x, y

    elif event == cv2.EVENT_LBUTTONUP:
        print('EVENT_LBUTTONUP: %d, %d' % (x, y))

    elif event == cv2.EVENT_MOUSEMOVE:
        if flags & cv2.EVENT_FLAG_LBUTTON: #flags 라는 변수가 L버튼으로 된지 확인해서 그냥 움직일떈 되지않고 클릭해서 움직일때만 사용. 중요* 다른 키를 같이 눌리면 확인 못함. 따라서 &연산자 사용해서 어느 상황에서도 되도록.
            cv2.line(img, (oldx, oldy), (x, y), (255, 0, 255), 4, cv2.LINE_AA) #점 찍는 코드 여기서는  0,0,255 ,4의 크기로  빨리움직이면 끊김 따라서 AA사용
            cv2.imshow('image', img)
            oldx, oldy = x, y

        elif flags & cv2.EVENT_FLAG_MBUTTON:
             cv2.line(img, (newx,newy), (x, y), (0, 0, 255), 4, cv2.LINE_AA)
             cv2.imshow('image', img)
             newx, newy = x,y
                
           


img = np.ones((480, 640, 3), dtype=np.uint8) * 255 # 흰색 창을 띄우는 코드 ,ones는 1로채워지는 흰색바탕 여기서 255를 곱해서 255로 다 되어있음

cv2.namedWindow('image')
cv2.setMouseCallback('image', on_mouse, img) #마우스 호출, 위치 중요 여기서 image가 먼저 띄어지고 커서가 뜨는 순서로 작성해야함 ** 중요

cv2.imshow('image', img)
cv2.waitKey()

cv2.destroyAllWindows()
