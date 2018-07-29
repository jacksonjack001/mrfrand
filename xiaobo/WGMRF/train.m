function [mu,sigma,sita]=train(image,nei8_image,BW)
bands=size(image,3);
BW=imstack2vectors(BW);
image=imstack2vectors(double(image));

image_BW=image(BW,:);
N=size(image_BW,1);
nei8_image_BW=nei8_image(BW,:);

mu=mean(image_BW);
q=nei8_image_BW-2*repmat(mu,[N,4]);

dji=[];
for j=1:bands
    for r=1:4
        dji=cat(2,dji,q(:,(j-1)*4+r));
    end
end

clear q;
dj=image_BW-repmat(mu,[N,1]);
sita=inv(dji'*dji)*(dji'*dj);
sigma=1/N*(dj-dji*sita)'*(dj-dji*sita);
mu=mu';
end


