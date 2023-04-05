import sys
import cv2


cap = cv2.VideoCapture(0)

if not cap.isOpened():
    print("Camera open failed!")
    sys.exit()

w = round(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
h = round(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps = cap.get(cv2.CAP_PROP_FPS)

fourcc = cv2.VideoWriter_fourcc(*'DIVX') # *'DIVX' == 'D', 'I', 'V', 'X'
#fourcc = cv2.VideoWriter_fourcc('D', 'I', 'V', 'X')
delay = round(1000 / fps)

out = cv2.VideoWriter('output.avi', fourcc, fps, (w, h)) #저장명 가로세로크기 w,h 컬러로 저장하는건데 edge는 그ㅜ레이스케일

if not out.isOpened():
    print('File open failed!')
    cap.release()
    sys.exit()

while True:
    ret, frame = cap.read() #카메라에서 프레임 받아오기

    if not ret:
        break

    #inversed = ~frame #프레임 변환
    edge = cv2.Canny(frame, 50, 150)
    edge_color = cv2.cvtColor(edge, cv2.COLOR_GRAY2BGR)
    #out.write(inversed)
    out.write(edge_color)

    cv2.imshow('frame', frame)
    cv2.imshow('edge',edge)
   # cv2.imshow('inversed', inversed)

    if cv2.waitKey(delay) == 27:
        break

cap.release()
out.release()
cv2.destroyAllWindows()
