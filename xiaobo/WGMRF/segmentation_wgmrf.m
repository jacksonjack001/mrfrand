function [seg_n,relative0,relative1]=segmentation_wgmrf(seg_p,ll_n,relative1,potential,handles)
[W,H,M]=size(ll_n);
err=0.00001;
relative1_old=relative1;
relative1_new=1;
relative1_diff=abs(relative1_new-relative1_old);
iter=1;
maxIter=30;

while (iter<maxIter)...
        &&(relative1_diff>err)
    [ET,seg_n]=expectationForT(seg_p,ll_n,M,relative1_old);
    err=1e-5;
    [relative1_new, diff_Q]=solve(0.01,0.99,ET,M,err);
    relative1_diff=abs(relative1_new-relative1_old);
    relative1_old=relative1_new;
    pause(0.2);
    imshow(mat2gray(seg_n));
    iter=iter+1
end
seg_n=pottsSeg(ll_n,seg_n,potential,handles);
relative0=sum(ET(2,:))/sum(sum(ET));
relative1=relative1_new;

% relative0,relative1

end


