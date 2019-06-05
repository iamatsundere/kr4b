clear;clc;
[filename,pathname]=uigetfile('*');
file_r_id=fopen(filename,'r');
T = fread(file_r_id);
char(T)'

ET=rc4_text(T,[2,1,3]);
char(ET)
file_e_id = fopen(sprintf('%s%s_%s',pathname,'encoded',filename),'w+');
%should use this one because sometimes read the whole text may case unicode
%error
fwrite(file_e_id, ET);

fclose(file_r_id);
fclose(file_e_id);