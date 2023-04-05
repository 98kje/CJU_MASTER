import numpy as np
import cv2

img = np.full((400, 400, 3), 255, np.uint8) #400x 400 컬러영상 255는 흰색으로 채워진 배경

cv2.line(img, (50, 50), (200, 50), (0, 0, 255), 5) # 50,50 에서 200,50 가로로 150픽셀 색은 빨간색 선의 두께는 5픽셀
cv2.line(img, (50, 60), (150, 160), (0, 0, 128)) # 50,60 에서 150,160 으로 이동 45도 이동으로 조금 진한 빨간색으로 그리기. 선은 없으니 1픽셀

cv2.rectangle(img, (50, 200, 150, 100), (0, 255, 0), 2) #50,200부터 가로 150 세로 100크기 녹색으로 그리고 2픽셀로 그림
cv2.rectangle(img, (70, 220), (180, 280), (0, 128, 0), -1) #사각형 안쪽 70,220에서 180,280-> 이부분은 원래 사각형보다 조금 작게그린거 -1은 가득채움 128은 짙은 녹색

cv2.circle(img, (300, 100), 30, (255, 255, 0), -1, cv2.LINE_AA)#300,100의 반지름 30 , 파란색과 초록색 기반 색이 가득 찬 동그라미
cv2.circle(img, (300, 100), 60, (255, 0, 0), 3, cv2.LINE_AA) # 300, 100의 반지름 60. 파란색 두께 3인 동그라미. 여기서 라인타입 8로 그리면 동그라미의 경우 거친느낌이 있음. 이에 따라 aa로 설정

pts = np.array([[250, 200], [300, 200], [350, 300], [250, 300]]) ## point 1 = 250,200 point2 = 300,200 ''''
cv2.polylines(img, [pts], True, (255, 0, 255), 2, cv2.LINE_AA)

text = 'Hello? JaeEun ' +'open CV Version : '+ cv2.__version__# 문자열로 출력하게 
cv2.putText(img, text, (10, 350), cv2.FONT_HERSHEY_SIMPLEX, 0.6, 
            (0, 0, 255), 1, cv2.LINE_AA)

cv2.imshow("img", img)
cv2.waitKey()
cv2.destroyAllWindows()

