clear;clc;
p=nextprime(sym('2')^255);
q=nextprime(sym('2')^256);
n=p*q;
fiN=(p-1)*(q-1);
e=17;
[ge,ce,de]=gcd(e,fiN);
if (isequal(uint8(ge),1))
    ex=mod(ce,fiN);
    d=mod(ex,fiN);
    m=121321233;
    c=modexp(m,e,n);
    mx=modexp(c,d,n)
else
    disp('e is invalid');
end
