[filename,pathname]=uigetfile('*');
file_e_id=fopen(filename,'r');
%parse char to array of ints to infinity size
%the last ' parse it to 1xn
T = fread(file_e_id);
char(T)'
fclose(file_e_id);
DT=rc4_text(T,[2,1,3]);
char(DT)
file_d_id=fopen(sprintf('%s%s_%s',pathname,'decoded',filename),'w+');
fwrite(file_d_id,DT);
fclose(file_d_id);