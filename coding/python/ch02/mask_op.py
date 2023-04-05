import sys
import cv2


# 마스크 영상을 이용한 영상 합성
src = cv2.imread('airplane.bmp', cv2.IMREAD_COLOR)
mask = cv2.imread('mask_plane.bmp', cv2.IMREAD_GRAYSCALE)
dst = cv2.imread('field.bmp', cv2.IMREAD_COLOR)

#src = cv2.imread('opencv-logo-white.png', cv2.IMREAD_UNCHANGED)
#mask = src[:, :, -1]
#src = src[:, :, 0:3]
#dst = cv2.imread('field.bmp',cv2.IMREAD_COLOR)

if src is None or mask is None or dst is None:
    print('Image load failed!')
    sys.exit()

#h, w = src.shape[0:2]

#crop = dst[0:h, 0:w] # 이 부분은 픽셀값을 조절함. 좌측상단 위치를 옮기고 싶으면 => 10:h+10, 10:w+10 이런 형식으로.

#cv2.copyTo(src, mask, crop) #기존에 없던 마스크 부분을 붙혀주는 함수

cv2.copyTo(src,mask,dst)
#dst = cv2.copyTo(src, mask) #이렇게 되면 검은화면에 비행기
# dst[mask > 0] = src[mask > 0]

cv2.imshow('src', src)
cv2.imshow('dst', dst)
cv2.imshow('mask', mask)
cv2.waitKey()
cv2.destroyAllWindows()

# 알파 채널을 마스크 영상으로 이용
src = cv2.imread('cat.bmp', cv2.IMREAD_COLOR)
logo = cv2.imread('opencv-logo-white.png', cv2.IMREAD_UNCHANGED)

if src is None or logo is None:
    print('Image load failed!')
    sys.exit()

mask = logo[:, :, 3]    # mask는 알파 채널로 만든 마스크 영상
logo = logo[:, :, :-1]  # logo는 b, g, r 3채널로 구성된 컬러 영상
h, w = mask.shape[:2]
crop = src[10:10+h, 10:10+w]  # logo, mask와 같은 크기의 부분 영상 추출

cv2.copyTo(logo, mask, crop)
#crop[mask > 0] = logo[mask > 0]

cv2.imshow('src', src)
cv2.imshow('logo', logo)
cv2.imshow('mask', mask)
cv2.waitKey()
cv2.destroyAllWindows()
