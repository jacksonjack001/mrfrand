function [seg,relative0,relative1]=seg_multiscale_wgmrf(ll,relative1,potential,handles)
level_number=size(ll,1);
seg=cell(level_number,1);

n=level_number;
ll_n=ll{n};
[tmax,tid]=max(ll_n,[],3);

tid=pottsSeg(ll_n,tid,potential,handles);
seg{n}=tid;

relative0=ones(level_number,1);
for n=level_number-1:-1:1
    seg_p=seg{n+1};
    ll_n=ll{n};
%     relative1(n)
    [seg_n,relative0(n),relative1(n)]=segmentation_wgmrf(seg_p,ll_n,relative1(n),potential,handles);
    seg{n}=seg_n;
end

end