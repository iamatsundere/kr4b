function EI=rc4_img(I,K)
S=0:255;
[m p q]=size(I);
n=length(K);
j=0;
for i=0:255,
    j = mod(j+S(i+1)+K(1+mod(i,n)),256);
    tmp=S(i+1);
    S(i+1)=S(j+1);
    S(j+1)=tmp;
end

i=0;
j=0;
n=numel(I);
EI=zeros(1,n);
for k=1:n
    i=1+mod(i+1,256);
    j=1+mod(j+S(i),256);
    tmp=S(i);
    S(i)=S(j);
    S(j)=tmp;
    Ks=1+mod(S(i)+S(j),256);
    EI(k)=bitxor(S(Ks),I(k));
end

EI=uint8(reshape(EI,m,p,q));
