function [seg]=pottsSeg(ll,seg,potential,handles)
class_number=size(ll,3);
maxIter=10;
iter=1;

while(iter<maxIter)
    label_energy=energyOfLabelField(seg,potential,class_number);
    exp_energy=exp(-label_energy);
    
    exp_sum=repmat(sum(exp_energy,3),[1,1,class_number]);
    
    prob=exp_energy./exp_sum;
    
    [tm,seg]=max(prob.*exp(ll),[],3);
    
%     imshow(seg,[])
%     iter
    iter=iter+1;
    
end
end