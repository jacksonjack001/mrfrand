function [para]=trainWMSRF(image,wavelet_base,class_number,level_number)
para=repmat(struct('mu',[],'sigma',[],'sita',[]),[level_number+1 class_number]);
image=double(image);
w=my_wavelet_decomposition(image,level_number,wavelet_base);

nei8_w=cell(level_number+1,1);
for iLevel=1:level_number+1
    w_iLevel=w{iLevel};
    nei8_w{iLevel}=imstack2vectors(neighbor8syn(w_iLevel));
end

h=figure;
for iclass=1:class_number
    BW=roipoly(mat2gray(image));
    for iLevel=1:level_number+1
        step=2^(iLevel-1);
        BW_iLevel=BW(1:step:end,1:step:end);
        
        w_iLevel=w{iLevel};
        nei8_w_iLevel=nei8_w{iLevel};
        
        [mu,sigma,sita]=train(w_iLevel,nei8_w_iLevel,BW_iLevel);
        
        para(iLevel,iclass).mu=mu;
        para(iLevel,iclass).sigma=sigma;
        para(iLevel,iclass).sita=sita;
    end
end
close(h);
end
    
