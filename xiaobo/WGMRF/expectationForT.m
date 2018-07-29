function [ET,seg]=expectationForT(seg_p,ll_n,class_number,relative1)
[W,H]=size(seg_p);
seg_p_r=zeros(size(seg_p));
seg_p_d=zeros(size(seg_p));
seg_p_r(1:end,1:end-1)=seg_p(1:end,2:end);
seg_p_d(1:end-1,1:end)=seg_p(2:end,1:end);

T=zeros(W,H,2,3,class_number);
for m=1:class_number
    seg_p_m=(seg_p==m);
    seg_p_r_m=(seg_p_r==m);
    seg_p_d_m=(seg_p_d==m);
    seg_p_u=seg_p_r_m+seg_p_d_m;
    
    for l=1:2
        for h=1:3
            tm1=(seg_p_m==(l-1));
            tm2=(seg_p_u==(h-1));
            tm=tm1&tm2;
            T(:,:,l,h,m)=tm;
        end
    end
end

ET_for_pos=zeros(2*W,2*H,2,3,class_number);
for l=1:2
    for h=1:3
        for m=1:class_number
            T_lhm=T(:,:,l,h,m);
            T_lhm=myZoomOut(T_lhm);
            
            P_lhm=(3*(l-1)+2*(h-1))*relative1/7+(1-relative1)/class_number;
            ll_n_m=ll_n(:,:,m);
            ET_for_pos(:,:,l,h,m)=T_lhm.*exp(ll_n_m)*P_lhm;
        end
    end
end

ET_for_pos=sum(ET_for_pos,5);
P_for_pos=zeros(2*W,2*H,class_number);
for m=1:class_number
    ll_n_m=ll_n(:,:,m);
    seg_p_m=(seg_p==m);
    seg_p_r_m=(seg_p_r==m);
    seg_p_d_m=(seg_p_d==m);
    seg_p_u=seg_p_r_m+seg_p_d_m;
    
    P_tm=(3*seg_p_m+2*seg_p_u)*relative1/7+(1-relative1)/class_number;
    P_tm=myZoomOut(P_tm);
    
    P_for_pos(:,:,m)=exp(ll_n_m).*P_tm;
end

[tm,seg]=max(P_for_pos,[],3);

P_for_pos=sum(P_for_pos,3);
ET=zeros(2,3);
for l=1:2
    for h=1:3
        ET_for_pos_lh=ET_for_pos(:,:,l,h);
        tm=ET_for_pos_lh./P_for_pos;
        ET(l,h)=sum(sum(tm));
    end
end
end