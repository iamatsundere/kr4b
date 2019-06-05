function x=dec_affine(y,a,b)
    [g,c,d]=gcd(a,26);
    ax=mod(c,26);
    x=mod(ax*(y-b),26);