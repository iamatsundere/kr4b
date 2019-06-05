clear;
p=str2sym('9874103');
k=str2sym('11');
a=str2sym('9874103');
b=str2sym('9874103');

factor(p-1)

p=feval(symengine,'nextprime',p);
fprintf('p is invalid, must be prime, change p to %s\n', p);

if ne(isprime(p),1)
    disp('p is invalid, must be prime')
elseif ne(gcd(a,p-1),1)
    disp('a is invalid')
elseif ne(gcd(b,p-1),1)
    disp('b is invalid')
elseif k>=p
    disp('k is invalid, must be lower than p')
else    
    [ga,ca,da]=gcd(a,p-1);
    ax=mod(ca,p-1)
    [gb,cb,db]=gcd(b,p-1);
    bx=mod(cb,p-1)
    k1=mod(sym(k^a),p)
    k2=mod(sym(k1^b),p)
    k3=mod(sym(k2^ax),p)
    kx=mod(sym(k3^bx),p);
    fprintf('private k is %d\n', kx);
end