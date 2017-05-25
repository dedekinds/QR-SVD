function SVDimagealgorithm()
clear
I=imread('test.jpg')
R=double(I(:,:,1))
G=double(I(:,:,1))
B=I(:,:,1)
[Ru,Rz,Rv]=svd(R)
[Gu,Gz,Gv]=svd(G)
[Bu,Bz,Bv]=svd(B)


imshow(B)