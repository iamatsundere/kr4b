function sub_arr=find_max_sub_arr(arr)
len_got=0;
len=1;
for skip=0:(length(arr)/3)
    for len=1:(length(arr)/3)
        len_got=0;
        for i=1+skip:len+skip
            if ((i+len)>length(arr))
                sub_arr=arr(1:len);
                return
            end
            if (arr(i)~=arr(i+len))
                break
            else
                len_got=len_got+1;
            end
        end
        %         disp(sprintf('%d %d %d %d',i,len,i+len,length(arr)));        
        if (len==len_got)
            sub_arr=arr(1:len);
            return
        end
    end
end