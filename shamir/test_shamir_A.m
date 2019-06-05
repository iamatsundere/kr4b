clear; clc;
% 2013 2026
p=sym('2027');
fprintf('p = %s\n', p);
% if (ne(isprime(p),1))
%     p=feval(symengine,'nextprime',p);
%     fprintf('p phai la so nguyen to, thay p bang %s\n', p);
% end
%Doan tren giup tu sinh ra mot so nguyen to cuc lon de test, neu p ban dau
%khong thoa man thi matlab se sinh giup p

%Khoa k bat ky
k=sym('127');

disp('Liet ke cac thua so cua p-1, khong chon a trong danh sach nay:');
factor(p-1)
% a=sym('3');
a=p;

if ne(isprime(p),1)
    disp('p khong thoa man, p phai la so nguyen to')
elseif ne(gcd(a,p-1),1)
    disp('a khong thoa man do khong nguyen to voi p-1')
elseif k>=p
    disp(1);
    disp('k khong thoa man, phai nho hon p')
else    
    [ga,ca,da]=gcd(a,p-1);
    ax=mod(ca,p-1);
    k1=mod(k^a,p)
    k2=sym('172');%Nhan k2 tu b
    k3=mod(k2^ax,p)
end