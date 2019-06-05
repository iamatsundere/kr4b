function result=modexp(x,y,n)
if (y==0)
    result = 1;
    return;
end
z=modexp(x,floor(y/2),n);
if (mod(y,2)==0)
    result=mod(z*z,n);
    return
else
    result=mod(x*z*z,n);
    return
end
end