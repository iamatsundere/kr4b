function y=enc_affine(x,a,b)
    y = mod(a*x+b,26);