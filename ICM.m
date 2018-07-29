function segmentation=ICM(image,class_number,potential,maxIter)
[width,height,bands]=size(image);
image=reshape(image,width*height,bands);

[segmentation,c]=kmeans(image,class_number);
clear  c;

iter=0;
while iter<maxIter
    iter
    [mu,sigma]=GMM_parameter(image,segmentation,class_number);
    Ef=EnergyOfFeatureField(image,mu,sigma,class_number);
    El=EnergyOfLabel(segmentation,potential,width,height,class_number);
    E=Ef+El;
    [tm,segmentation]=min(E,[],2);
    iter=iter+1;
end
segmentation=reshape(segmentation,[width,height]);
end