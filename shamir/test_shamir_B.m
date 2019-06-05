% 2013 2026
p=str2sym('2027');
fprintf('p = %s\n', p);
if (ne(isprime(p),1))
    p=feval(symengine,'nextprime',p);
    fprintf('p phai la so nguyen to, thay p bang %s\n', p);
end
%Doan tren giup tu sinh ra mot so nguyen to cuc lon de test, neu p ban dau
%khong thoa man thi matlab se sinh giup p

disp('Liet ke cac thua so cua p-1, khong chon b trong danh sach nay:');
factor(p-1)
% b=sym('11');
b=p;

if ne(isprime(p),1)
    disp('p khong thoa man, p phai la so nguyen to')
elseif ne(gcd(b,p-1),1)
    disp('b khong thoa man do khong nguyen to voi p-1')
else
    [gb,cb,db]=gcd(b,p-1);
    bx=mod(cb,p-1);
    k1=str2sym('1723')%Nhan k1 tu A
    k2=mod(k1^b,p)
    k3=str2sym('21')%Nhan k3 tu B
    kx=mod(k3^bx,p);
    fprintf('khoa k la %d\n', kx);
end