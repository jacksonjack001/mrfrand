function [mu,sigma]=GMM_parameter(image,segmentation,class_number)
[n,d]=size(image);

mu=zeros(class_number,d);
sigma=zeros(d,d,class_number);

for i=1:class_number
    Im_i=image(segmentation==i,:);
    [sigma(:,:,i),mu(i,:)]=covmatrix(Im_i);
end
end

function [C,m]=covmatrix(X)
[K,n]=size(X);
X=double(X);
if K==1
    C=0;
    m=X;
else
    m=sum(X,1)/K;
    X=X-m(ones(K,1),:);
    C=(X'*X)/(K-1);
    m=m';
end
end