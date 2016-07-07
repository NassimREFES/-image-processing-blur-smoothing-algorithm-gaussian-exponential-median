function img_zp = zero_padding(img_zp, i)
    [x, y] = size(img_zp)
        %  lignes
        up = zeros(i(2),y);
        img_zp = [up; img_zp(1:x,:)];
        x = x + i(2);
        bottom = zeros(i(2),y);
        img_zp = [img_zp; bottom];
        x = x + i(2);
    
        %  colonnes
        left = zeros(x,i(1));
        img_zp = [left img_zp(:,1:y)];
        y = y + i(1);
        right = zeros(x,i(1));
        img_zp = [img_zp right];
        y = y + i(1);
end

