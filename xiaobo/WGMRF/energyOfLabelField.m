function [E]=energyOfLabelField(segmentation,potential,class_number)
[width,height]=size(segmentation);
n=width*height;
% segmentation=reshape(segmentation,[width,height]);
% 8 columns
Nei8=imstack2vectors(NeiX(segmentation));

E=zeros(n,class_number);
for i=1:class_number
%     temp=(Nei8~=i)*potential+(Nei8==i)*(-potential);
    temp=(Nei8~=i)*potential;
    E(:,i)=sum(temp,2);
end
E=reshape(E,width,height,class_number);
E=E*potential;
end