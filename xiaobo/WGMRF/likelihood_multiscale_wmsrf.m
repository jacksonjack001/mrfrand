function [ll]=likelihood_multiscale_wmsrf(ll,relation,class_number)
level_number=size(ll,1);

for n=2:level_number
    ll_node=ll{n};
    
    ll_child=exp(ll{n-1});
    
    ll_current=[];
    tm_same_label=relation(n)*ll_child;
    %n=2, 256*256
    tm_distinct_label=(1-relation(n))/class_number*squeeze(sum(ll_child,3));
    
    for m=1:class_number
        tm=log(tm_same_label(:,:,m)+tm_distinct_label);
        tm_current=ll_node(:,:,m);
        tm_current=tm_current+tm(1:2:end,1:2:end);
        tm_current=tm_current+tm(2:2:end,1:2:end);
        tm_current=tm_current+tm(1:2:end,2:2:end);
        tm_current=tm_current+tm(2:2:end,2:2:end);
        ll_current=cat(3,ll_current,tm_current);
    end
    ll{n}=ll_current;
end
end