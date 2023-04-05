import sys
import numpy as np
import cv2


# 그레이스케일 영상 불러오기
src = cv2.imread('lenna.bmp', cv2.IMREAD_GRAYSCALE)
#컬러로 불러왔다? dst = cv2.add(src, 100,x,y,z) 까지해줘야함
if src is None:
    print('Image load failed!')
    sys.exit()

dst = cv2.add(src, 100)
#dst = src + 100 이코드는 대체로 밝은부분이 어두운. ?? 255보다 커지면 0에 가까운 값에 저장됨 따라서 밝은부분이 어두워짐
#dst = np.clip(src + 100., 0, 255).astype(np.uint8)   여기서는 .을찍어서 실수부분으로 계산되게 이 함수는 add와 같음.

cv2.imshow('src', src)
cv2.imshow('dst', dst)
cv2.waitKey()

# 컬러 영상 불러오기
src = cv2.imread('lenna.bmp')

if src is None:
    print('Image load failed!')
    sys.exit()

dst = cv2.add(src, (100, 100, 100, 0))
#dst = np.clip(src + 100., 0, 255).astype(np.uint8)

cv2.imshow('src', src)
cv2.imshow('dst', dst)
cv2.waitKey()

cv2.destroyAllWindows()
