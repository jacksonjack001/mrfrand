load belmont2;
imshow(mat2gray(X))
imwrite(mat2gray(X),'belmont2.png')

[cA,cH,cV,cD]=dwt2(X,'db1');
figure;
subplot(2,2,1)
imshow(mat2gray(cA))
title('low')

subplot(2,2,2)
imshow(mat2gray(cH))
title('high')

subplot(2,2,3)
imshow(mat2gray(cV))
title('hor')

subplot(2,2,4)
imshow(mat2gray(cD))
title('vertical')
