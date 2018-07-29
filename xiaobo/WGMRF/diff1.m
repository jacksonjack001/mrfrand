function [f]=diff1(ET,relative1,class_number)
f=0;
for l=1:2
    for h=1:3
        fenzi=(3*(l-1)+2*(h-1))/7-1/class_number;
        fenmu=(3*(l-1)+2*(h-1))/7*relative1+(1-relative1)/class_number;
        f=f+ET(l,h)*fenzi./fenmu;
    end
end