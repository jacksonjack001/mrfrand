clc;clear;
warning('off');
I=imread('combine_4.gif');h=imshow(I);
level=4;
% param=trainWMSRF(I,'haar',4,level-1);
% save(['wgmrf_level',num2str(level),'.mat'],'param');
load(['wgmrf_level',num2str(level),'.mat']);
seg=segWGMRF(I,'haar',4,level-1,param,h);
for i=1:level
    subplot(1,level,i)
    imshow(seg{i},[]);
end

% clc;clear;
% I=imread('combine_4.gif');h=imshow(I);
% load('wmsrf.mat');
% % param=trainWMSRF(I,'haar',4,4);
% % save('wmsrf.mat','param')
% [seg]=segWMSRF(I,'haar',4,3,param,h)
% subplot(1,3,1)
% imshow(seg{2},[]);
% subplot(1,3,2)
% imshow(seg{3},[]);
% subplot(1,3,3)
% imshow(seg{4},[])


% clc;clear;
% I=imread('combine_4.gif');h=imshow(I);
%
% load('msrf.mat');
% % param=trainMSRF(I,4);
% % save('msrf.mat','param')
%
% seg=segMSRF(I,4,3,param,h);
% subplot(1,3,1)
% imshow(seg{2},[]);
% subplot(1,3,2)
% imshow(seg{3},[]);
% subplot(1,3,3)
% imshow(seg{4},[])


