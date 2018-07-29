clc;clear;
I=imread('image.jpg');
%imshow(I)
I1=double(I(:,:,1));
[m,n]=size(I1);
imshow(I1,[])

image=reshape(I1,[m*n,1]);
[segmentation,c]=kmeans(image,2);
segmentation=reshape(segmentation,[m,n]);
imshow(segmentation,[])