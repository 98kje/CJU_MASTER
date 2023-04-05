import sys
import cv2

#cap = cv2.VideoCapture()
#cap.open(0)
#cap = cv2.VideoCapture(0) #0번카메라 키기
cap = cv2.VideoCapture('video2.mp4') #비디오 켜기

if not cap.isOpened():
    print('camera is not open')
    sys.exit()

w = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
h = cap.get(cv2.CAP_PROP_FRAME_WIDTH)  #무조건 double로 보내줌 경우에 따라 int(cap.get(cv.CAP_PROP_FRAME_HEIGHT))로 정수값 출력가능

#cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 640)
#cap.set(cv2.CAP_PROP_FRAME_WIDTH, 400)  #대부분 320 240 크기 지정된 몇가지 코드가 있음

print(h,w)

while True:
    #frame = cap.read() ##한 프레임 받아올꺼야 즉 여기에 True, False 값을 받음 
    ret,frame = cap.read() #따라서 배열로 받음 True,False와 값을 받기위해

    if not ret:
        break ##동영상은 마지막프레임에서 알아서 꺼진다.
    
     
   ##프레임을 받아오고 프레임의 정지영상을 처리하는 코드작성가능
    edge = cv2.Canny(frame, 50, 150) #윤곽선 적용하는 코드



    cv2.imshow('Frame', frame)
    cv2.imshow('edge', edge)
    if cv2.waitKey(20) == 27:
            break    #20mmsecond 기다려줌
cap.release()
cv2.destroyAllWindows()