clear;clc;
[filename,pathname]=uigetfile('*');
I=imread(filename);
imshow(I); pause
his_prng=histogram(I);pause; 
std(his_prng.Values)  
EI=rc4_img(I,[2,1,3]);
imshow(EI); pause
his_prng=histogram(EI);pause; 
std(his_prng.Values)    
DI=rc4_img(EI,[2,1,3]);
imshow(DI);