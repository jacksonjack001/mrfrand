function [para]=trainMSRF(image,class_number)
para=repmat(struct('mu',[],'sigma',[],'sita',[]),[class_number 1]);
nei8_image=neighbor8syn(image);
nei8_image=imstack2vectors(nei8_image);

h=figure;
for iclass=1:class_number
    BW=roipoly(image);
    [mu,sigma,sita]=train(image,nei8_image,BW);
    para(iclass).mu=mu;
    para(iclass).sigma=sigma;
    para(iclass).sita=sita;
end

close(h);
end