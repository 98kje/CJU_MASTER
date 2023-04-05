import sys
import numpy as np
import cv2


# 두 개의 동영상을 열어서 cap1, cap2로 지정
cap1 = cv2.VideoCapture('video1.mp4')
cap2 = cv2.VideoCapture('video2.mp4')

if not cap1.isOpened() or not cap2.isOpened():
    print('video open failed!')
    sys.exit() #예외처리코드 필수!
#1280x720 의 동영상
# 두 동영상의 크기, FPS는 같다고 가정함
frame_cnt1 = round(cap1.get(cv2.CAP_PROP_FRAME_COUNT))
frame_cnt2 = round(cap2.get(cv2.CAP_PROP_FRAME_COUNT))
fps = cap1.get(cv2.CAP_PROP_FPS)
effect_frames = int(fps * 2)

print('frame_cnt1:', frame_cnt1)
print('frame_cnt2:', frame_cnt2)
print('FPS:', fps)

delay = int(1000 / fps)

w = round(cap1.get(cv2.CAP_PROP_FRAME_WIDTH))
h = round(cap1.get(cv2.CAP_PROP_FRAME_HEIGHT))
fourcc = cv2.VideoWriter_fourcc(*'DIVX')

# 출력 동영상 객체 생성 (동영상저장)
out = cv2.VideoWriter('output.avi', fourcc, fps, (w, h))

# 1번 동영상 복사
#첫번째 방법
#while True:
#    ret1, frame1 = cap1.read()

#    if not ret1:
#        break

#    out.write(frame1)

#    cv2.imshow('frame',frame1)
#    cv2.waitKey(delay)
    
    #두번째 방법
for i in range(frame_cnt1 - effect_frames): #1번 영상에서 48프레임 정도 남겨두고 그대로 출력
    ret1, frame1 = cap1.read()

    if not ret1:
       print('frame read error!')
       sys.exit()

    out.write(frame1)
    print('.', end='')

    cv2.imshow('output', frame1)
    cv2.waitKey(delay)

# 1번 동영상 뒷부분과 2번 동영상 앞부분을 합성하는 구간
for i in range(effect_frames):
    ret1, frame1 = cap1.read() #cap1에서 들고오기
    ret2, frame2 = cap2.read() #cap2에서 들고오기

    if not ret1 or not ret2:
        print('frame read error!')
        sys.exit()

    dx = int(w / effect_frames) * i #w는 전체 =1280/ 48 

    frame = np.zeros((h, w, 3), dtype=np.uint8) #컬러영상
    frame[:, 0:dx, :] = frame2[:, 0:dx, :] # : = 전체 0,dx까지 
    frame[:, dx:w, :] = frame1[:, dx:w, :] # dx:w 는 dx에서 w까지

    #alpha = 1.0 - i  / effect_frames
    #frame = cv2.addWeighted(frame1, 1 - alpha, frame2, alpha, 0) #2번째 alpha와 1-alpha의 값이 1이되어야함 0에서 1사이값 i가 0일때 1이되어야함
    #점점 흐려지며 동영상 전환


    out.write(frame)
    print('.', end='')

    cv2.imshow('output', frame)
    cv2.waitKey(delay)

# 2번 동영상을 복사
for i in range(effect_frames, frame_cnt2):
    ret2, frame2 = cap2.read()

    if not ret2:
        print('frame read error!')
        sys.exit()

    out.write(frame2)
    print('.', end='')

    cv2.imshow('output', frame2)
    cv2.waitKey(delay)

print('\noutput.avi file is successfully generated!')

cap1.release()
cap2.release()
out.release()
cv2.destroyAllWindows()
