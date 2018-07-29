function [seg]=segMSRF(image,class_number,level_number,parameter,handles)
relation0=ones(level_number+1,1);
relation1=ones(level_number+1,1)*0.5;

ll=cell(level_number+1,1);
ll{1}=likelihood(image,parameter,class_number);
iter=0;
while(iter<2)
    %fine to coarse
    ll=likelihood_multiscale(ll,relation0,class_number);
    %coarse to fine
    [seg,reltation0,relation1]=seg_multiscale(ll,relation1,handles);
    iter=iter+1;
end
end
