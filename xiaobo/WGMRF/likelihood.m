function [ll]=likelihood(image,parameter,class_number)
image=double(image);
[W,H,B]=size(image);
N=W*H;

image_nei=neighbor8syn(image);

image=imstack2vectors(image);
image_nei=imstack2vectors(image_nei);

neighbor_number=4;
ll=[];

for m=1:class_number
    mu=parameter(m).mu;
    sigma=parameter(m).sigma;
    sita=parameter(m).sita;
    
    e_image=image-repmat(mu',[N,1]);
    e_neighbor=image_nei-2*repmat(mu',[N,neighbor_number]);
    
    tm=[];
    for j=1:B
        for r=1:neighbor_number
            tm=cat(2,tm,e_neighbor(:,(j-1)*4+r));
        end
    end
    
    e_neighbor=tm;
    clear tm;
    error=e_image-e_neighbor*sita;
    
    ll_m=-0.5*sum(error*inv(sigma).*error,2)-0.5*log(det(sigma))-B/2*log(2*pi);
    ll=cat(3,ll,reshape(ll_m,[W,H]));
end
end
    