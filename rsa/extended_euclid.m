function [x,y,d]=extended_euclid(a,b)
    if b==0
        x=1;
        y=0;
        d=a;
        return;
    end
    [x1,y1,d1]=extended_euclid(b,mod(a,b));  

    x=y1;
    y=x1-floor(a/b)*y1;
    d=d1;

end 