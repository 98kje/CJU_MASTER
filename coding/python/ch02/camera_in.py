import sys
import cv2


# 카메라 열기
cap = cv2.VideoCapture(0) ## 0번째 카메라 작업관리자의
#cap.open(0) # 기본 카메라 오픈하겠다
if not cap.isOpened(): #오픈이 제대로 되지않으면 
    print("Camera open failed!")
    sys.exit()

# 카메라 프레임 크기 출력
print('Frame width:', int(cap.get(cv2.CAP_PROP_FRAME_WIDTH)))
print('Frame height:', int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT)))

# 카메라 프레임 처리
while True:
    ret, frame = cap.read()

    if not ret:
        break

    inversed = ~frame  # 반전

    cv2.imshow('frame', frame)
    cv2.imshow('inversed', inversed)

    if cv2.waitKey(10) == 27:
        break

cap.release()
cv2.destroyAllWindows()
