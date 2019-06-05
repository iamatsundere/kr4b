clear;clc;
disp('select encoded image');
[filename,pathname]=uigetfile('*.png;*.bmp');
EI=imread(filename);
[m p q]=size(EI);
imshow(EI);pause;
n=numel(EI);
disp('select background');
[filenameBG,pathnameBG]=uigetfile('*.png;*.bmp');
arrBackground=imread(filenameBG);
disp('end get bg');

disp('get arr key');
arrKey=zeros(1,n);
for i=1:n
    res=bitxor(arrBackground(i),EI(i));
    arrKey(i)=res;
end
disp('end get arr key');

disp("find key");
key=find_max_sub_arr(arrKey);

tmp=1:n;
for i=0:n-1
    tmp(i+1)=key(mod(i,length(key))+1);
end
tmp=uint8(reshape(tmp,m,p,q));
DI=bitxor(tmp,EI);
imshow(DI);