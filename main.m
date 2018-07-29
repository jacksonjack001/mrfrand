clc;clear;
I=imread('image.jpg');
I=double(I);
% imshow(I)
% I1=double(I(:,:,1));
% imshow(I1,[])
class_number=2;
potential=50;
maxIter=30;

seg=ICM(I,class_number,potential,maxIter);
imshow( seg ,[])
% imwrite(mat2gray(seg),'seg.png')