import sys
import glob
import cv2
import os

# img_files = glob.glob('.\\images\\*.jpg')
path = "/home/kimjaen/coding/python/ch01/images/"
#img_files = os.listdir(path)
#img_files.sort()
file_list = os.listdir(path)
#ext = '.jpg'||'adf'
img_files = [file for file in file_list if file.endswith('.jpg')]
img_files.sort()

for f in img_files:
     print(f)
                        #루프함수로 파일 출력
cv2.namedWindow('image', cv2.WINDOW_NORMAL) # 전체화면띄우는 코드    
cv2.setWindowProperty('image', cv2.WND_PROP_FULLSCREEN,cv2.WND_PROP_FULLSCREEN)

cnt = len(img_files) #파일개수
idx = 0 #인덱스값 

while True:
    img = cv2.imread(path+img_files[idx])
    if img is None:
        print("Image load failed!")
        break

    cv2.imshow('image', img)


    if cv2.waitKey(1000) == 27:
        # break
    
     idx += 1
     if idx >= cnt:
         idx = 0
    elif cv2.waitKey() == ord("q"):
        break
cv2.destroyAllWindows()