clear;clc;
p=nextprime(sym('2')^255);
q=nextprime(sym('2')^256);
n=p*q;
fiN=(p-1)*(q-1);

text='an';
textI=double(text);;
e=5;
[ge,ce,de]=gcd(e,fiN);
len=length(textI);
textE=zeros(1,len);
for i=1:len,
    if (isequal(uint8(ge),1))
        m=textI(i);
        c=modexp(m,e,n);
        textE=[textE,c];
    else
        disp('e is invalid');
    end
end
textE

textD=zeros(1,len);
ex=mod(ce,fiN);
d=mod(ex,fiN);
for i=1:len,
    me=textE(i);
    mx=modexp(me,d,n);
    textD=[textD,mx];
end
textD
textDstr=char(textD)