clear;clc;
key=[0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1];
[filename,pathname]=uigetfile('*.png;*.bmp');
I=imread(filename);
[m p q]=size(I);
imshow(I); pause;
% encoding image into array of bits
Imbin = de2bi(I);
Iabin=reshape(Imbin,[],64);

DIbin=[];
disp('Start decoding...');
for i=1:length(Iabin),
    msg=Iabin(i,:);
    e_msg=des_mod(msg,'DEC',key);
    DIbin=[DIbin;e_msg];
end
disp('End of decoding...');
DIbin = reshape(DIbin, [], 8);
DI=bi2de(DIbin);
DI=uint8(reshape(DI,m,p,q));
imshow(DI); pause;
imwrite(DI,sprintf('%sdecoded01_%s',pathname,filename));