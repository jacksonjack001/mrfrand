function [seg]=segWGMRF(image,wavelet_base,class_number,level_number,parameter,handles)
relation0=ones(level_number+1,1);
relation1=ones(level_number+1,1)*0.5;

image=double(image);
w=my_wavelet_decomposition(image,level_number,wavelet_base);

ll=cell(level_number+1,1);
for iLevel=1:level_number+1
    w_iLevel=w{iLevel};
    parameter_iLevel=parameter(iLevel,:);
    ll{iLevel}=likelihood(w_iLevel,parameter_iLevel,class_number);
end

iter=0;
while(iter<1)
    
    ll=likelihood_multiscale_wmsrf(ll,relation0,class_number);
    %potential  >20 not suit at all, 15 to decrease step by step, 
    [seg,relation0,relation1]=seg_multiscale_wgmrf(ll,relation1,12,handles);
    relation1
%     [relation0,relation1]
    iter=iter+1;
end

end