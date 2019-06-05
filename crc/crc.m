clear;clc;
raw_msg='truong tien phuc';
raw_msg=raw_msg-0;
raw_msg
msg=[];
for i=1:length(raw_msg),
    raw_bin=de2bi(raw_msg(i));
    raw_bin=fliplr(raw_bin);
    msg=[msg,raw_bin];
end
% msg=[1 1 1 0 0 1 1 0];
poly=[1 1 0 0 1 ];%RC4
N=length(poly);
emsg=[msg zeros(1,N-1)];
[q r]=deconv(emsg,poly);
r=abs(r);
for i=1:length(r)
    a=r(i);
    if (mod(a,2)== 0 )
        r(i)=0;
    else
        r(i)=1;
    end
end
crc_msg=r(length(msg)+1:end);
bin_frame = bitor(emsg,r)
% dec_frame=reshape(bin_frame,[],4);
% dec_frame=bi2de(bin_frame)
