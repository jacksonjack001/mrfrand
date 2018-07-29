clc;clear;
I=imread('image.jpg');
imshow(I)

L=3;
w=cell(L+1,1);
w{1}=I;
for scale=2:L+1
    [LL,LH,HL,HH]=dwt2(I,'haar');
    %     size(LL)
    w{scale}=cat(3,LL,LH,HL,HH);
    size(w{scale})
    I=LL;
end

imshow(mat2gray(HH))

load belmont2;
imshow(mat2gray(X))

[cA1,cH1,cV1,cD1]=dwt2(X,'db1');
imshow(mat2gray(cD1))