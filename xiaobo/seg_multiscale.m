function [seg,relative0,relative1]=seg_multiscale(ll,relative1,handles)
level_number=size(ll,1);
seg=cell(level_number,1);

n=level_number;
ll_n=ll{n};
[tmax,tid]=max(ll_n,[],3);
seg{n}=tid;

relative0=ones(level_number,1);
for n=level_number-1:-1:1
    seg_p=seg{n+1};
    ll_n=ll{n};
    [seg_n,relative0(n),relative1(n)]=segmentation(seg_p,ll_n,relative1(n),handles);
    seg{n}=seg_n;
end
end
