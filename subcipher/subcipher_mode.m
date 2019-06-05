function cipher=subcipher_mode(msg)
% disp(msg);
alphabet='abcdefghijklmnopqrstuvwxyz';
capabet=upper(alphabet);

%normalizing text to lower case
for i=1:26,
    msg = strrep(msg,capabet(i),alphabet(i));
end

%remove non-alphabet case
X=1;
while X<=length(msg),
    if (double(msg(X))<97&&not(double(msg(X))==32));
        msg(X)='';
        X=X-1;
    elseif (double(msg(X))>122&&not(double(msg(X))==32));
        msg(X)='';
        X=X-1;
    else
        X=X+1;
    end
    if X==0
        X=1;
    end
end

for k=0:25,
    msg_init=msg;
    %     fprintf('%s:%s','msg_init',msg_init)
    cipherbetx_num=zeros(1,26);
    for i=1:length(alphabet),
        new_idx=mod((k+i-1),26)+1;
        %         disp(new_idx);
        cipherbetx_num(i)=capabet(new_idx);
    end
    cipherbetx_char=char(cipherbetx_num);
    
    %encode but to uppercase
    for i=1:26,
        msg_init=strrep(msg_init,alphabet(i),cipherbetx_char(i));
    end
    
    %change to lowercase
    for i=1:26,
        cipherbetx_char=strrep(cipherbetx_char,capabet(i),alphabet(i));
        msg_init=strrep(msg_init,capabet(i),alphabet(i));
    end
    
    disp('Here is the encoded result')
    %What does it mean??? 
%     fprintf('%s:%d:%s:%s\n','before',k,alphabet,cipherbetx_char);
%     alphabet=cat(1,alphabet,cipherbetx_char);
%     fprintf('%s:%d:%s:%s\n','after',k,alphabet,cipherbetx_char);
    cipher=msg_init;
    %     fprintf('%s:%d:%s:%s\n',capabet,k,cipherbetx_char,cipher);
    fprintf('Result of encoding by %d shift(s)\n from "%s"\n is: "%s"\n',k,msg,cipher);
end
