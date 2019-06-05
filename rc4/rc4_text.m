function ET=rc4_text(T,K)
limit=255;
S=0:limit;
m=numel(T);
n=length(K);
j=0;
for i=0:limit,
    j = mod(j+S(i+1)+K(1+mod(i,n)),limit+1);
    tmp=S(i+1);
    S(i+1)=S(j+1);
    S(j+1)=tmp;
end

i=0;
j=0;
ET=zeros(1,m);
for k=1:m
    i=1+mod(i+1,limit+1);
    j=1+mod(j+S(i),limit+1);
    tmp=S(i);
    S(i)=S(j);
    S(j)=tmp;
    Ks=1+mod(S(i)+S(j),limit+1);
    ET(k)=bitxor(S(Ks),T(k));
end
