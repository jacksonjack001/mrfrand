function [seg_n,relative0,relative1]=segmentation(seg_p,ll_n,relative1,handles)
[W,H,M]=size(ll_n);
V=zeros(2,3);

for l=1:2
    for h=1:3
        tm=(3*(l-1)+2*(h-1))*relative1/7+(1-relative1)/M;
        V(l,h)=log(tm);
    end
end

err=0.0001;
relative1_old=relative1;
relative1_new=1;
relative1_diff=abs(relative1_new-relative1_old);
while (relative1_diff>err)
    [ET,seg_n]=expectationForT(seg_p,ll_n,M,relative1_old);
    
    err=1e-5;
    relative1_new=solve(0,1,ET,M,err);
    
    relative1_diff=abs(relative1_new-relative1_old);
    relative1_old=relative1_new;
    pause(0.2);
%     axes(handles.axes_result);
    imshow(mat2gray(seg_n));
    relative1_diff
end

relative0=sum(ET(2,:))/sum(sum(ET));
relative1=relative1_new;
end