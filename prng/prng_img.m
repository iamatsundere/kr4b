function [EI,arr]=prng_img(I,A,B,M)
%[rows columns numberOfColorChannels] = size(yourImageArray);  % Best way
[m p q]=size(I);
x=2;
n=numel(I);
EI=zeros(1,n);
arr=[];
for k=1:n
    ks=0;
    for i=1:8
        x=mod(A*x+B,M);
        y=mod(x,2);
        ks=ks+y*2^(i-1);
    end
    arr=[arr,ks];
%     sprintf('%d %d',ks,I(k))
    EI(k)=bitxor(ks,I(k));
end
% arr(1:30)
EI=uint8(reshape(EI,m,p,q));
