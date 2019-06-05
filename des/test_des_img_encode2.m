clear;clc;
key=[0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1];
[filename,pathname]=uigetfile('*.png;*.bmp');
fid = fopen(filename,'rb');
I = fread(fid);
fclose(fid);
% encoding image into array of bits
Imbin = de2bi(I);

%append missing element to make I can devide to 64
[r_Imbin,c_Imbin] = size(Imbin);
remain = 8-mod(r_Imbin,8);
for i = 1:remain
    Imbin = [Imbin; zeros(1, 8)];
end

% converted into bits 64
Iabin=reshape(Imbin,[],64);
% Iabin = reshape(Imbin',1,numel(Imbin)); 

EIbin=[];
disp('Start encoding...');
for i=1:length(Iabin),
    msg=Iabin(i,:);
    e_msg=des_mod(msg,'ENC',key);
    EIbin=[EIbin;e_msg];
end
disp('End of encoding...');
%reshape each of 8 bits become a pixel
EIbin = reshape(EIbin, [], 8);
EI = bi2de(EIbin);
% EI=uint8(reshape(EI,m,p,q));
% imshow(EI); pause;
fe=fopen(sprintf('%sencoded02_%s',pathname,filename),'w+');
fwrite(fe,EI);
fclose(fe);