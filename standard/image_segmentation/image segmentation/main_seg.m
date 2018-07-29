clc
clear
addpath(genpath('./function'));

I=imread('image.jpg');
I=double(I);
class_number=2;
potential=100;
maxIter=30;
seg=ICM(I,class_number,potential,maxIter);
figure;
imshow(seg,[]);