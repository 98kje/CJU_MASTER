import sys
import time
import numpy as np
import cv2


img = cv2.imread('hongkong.jpg')

tm = cv2.TickMeter()

tm.reset()
tm.start()
t1 = time.time()

edge = cv2.Canny(img, 50, 150)  #20번 100번해서 반복해서 계산하고 평균내는게 맞음

tm.stop()

print('time:', (time.time() - t1) * 1000)
print('Elapsed time: {}ms.'.format(tm.getTimeMilli()))

