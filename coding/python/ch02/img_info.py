import sys
import cv2


# 영상 불러오기
img1 = cv2.imread('cat.bmp', cv2.IMREAD_GRAYSCALE) #그레이 타입으로 불러와서 img1에 저장.
img2 = cv2.imread('cat.bmp', cv2.IMREAD_COLOR) #컬러타입으로 불러와서 imh2에 저장


if img1 is None or img2 is None:
    print('Image load failed!')
    sys.exit()

# 영상의 속성 참조
print('type(img1):', type(img1))
print('img1.shape:', img1.shape)
print('img2.shape:', img2.shape)
print('img1.dtype:', img1.dtype)
print('img2.dtype:', img2.dtype)

# 영상의 크기 참조
h, w = img2.shape[:2]  # 2개로 받으려니깐 에러가 뜨기에 그냥 shape라 쓰지않고 shape[:2] 앞에꺼 두개만 받아와서 쓴다라는 말.
print('img2 size: {} x {}'.format(w, h)) #가로세로 크기 쓸때는 w X h로 쓰기에 밑에는 저렇게 설정.

if len(img1.shape) == 2:
    print('img1 is a grayscale image')
elif len(img1.shape) == 3:
    print('img1 is a truecolor image')

#x = 20
##y = 10
#p = img1[y,x]  #픽셀값 구할때
#print(p)

cv2.imshow('img1', img1)
cv2.imshow('img2', img2)
cv2.waitKey()

# 영상의 픽셀 값 참조
'''
for y in range(h): #파이썬은 이런함수가 되게 느리게 작동함.
    for x in range(w):
        img1[y, x] = 0
        img2[y, x] = (0, 255, 255)  #값을 집어넣음        
'''
img1[:,:] = 255
img2[:,:] = (0, 0, 255)
#이 방식을 자주사용함
cv2.imshow('img1', img1)
cv2.imshow('img2', img2)
cv2.waitKey()

cv2.destroyAllWindows()
