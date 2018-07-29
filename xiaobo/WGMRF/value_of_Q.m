function [f]=value_of_Q(ET,relative1,class_number)
f=0;
for l=1:2
    for h=1:3
        tm=(3*(l-1)+2*(h-1))/7*relative1+(1-relative1)/class_number;
        V_lh=log(tm);
        f=f+ET(l,h).*V_lh;
    end
end
end