% random_s = random_square(0.5,0.5,0.5);
clear;clc;
A=53;
B=91;
M=199;
[filename,pathname]=uigetfile('*.png');
I=imread(filename);
[m p q]=size(I);
imshow(I); pause;
% GI=rgb2gray(I);
% imshow(GI);pause;
[EI,~]=prng_img(I,A,B,M);
imshow(EI);pause;
imwrite(EI,sprintf('turn05/test_decode/input24_R_%d.bmp',M));