clear;clc;
key=[0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1];
[filename,pathname]=uigetfile('*.png;*.bmp');
fid = fopen(filename,'rb');
I = fread(fid);
fclose(fid);
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
fd=fopen(sprintf('%sdecoded02_%s',pathname,filename),'w+');
fwrite(fd,DI);
fclose(fd);