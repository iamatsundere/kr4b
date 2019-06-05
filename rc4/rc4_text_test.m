clear;clc;
[filename,pathname]=uigetfile('*');
fileid=fopen(filename,'r');
%parse char to array of ints to infinity size
%the last ' parse it to 1xn
T = fread(fileid, inf, 'uint8=>*char')';
char(T)
fclose(fileid);
ET=rc4_text(T,[2,1,3]);
char(ET)
feid = fopen(sprintf('%s%s_%s',pathname,'encoded',filename),'wt');
fprintf(feid, char(ET));
fclose(feid);
% his_prng=histogram(ET);pause;
% std(his_prng.Values)
DT=rc4_text(ET,[2,1,3]);
char(DT)

% https://www.mathworks.com/help/matlab/ref/fopen.html