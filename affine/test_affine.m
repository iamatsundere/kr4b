clear;clc;
a=25;
b=5;
p='helloworld';
c=enc_affine(p-'a',a,b);
char(c+'a')
p1=dec_affine(c,a,b);
char(p1+'a')