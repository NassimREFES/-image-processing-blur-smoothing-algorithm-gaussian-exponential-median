function img_dup = duplication(img_dup, i)
    [x, y] = size(img_dup)
    for dup = 1:i(2)
        % duplication des lignes
        up = img_dup(1,:);
        img_dup = [up; img_dup(1:x,:)];
        x = x + 1;
        bottom = img_dup(x,:);
        img_dup = [img_dup; bottom];
        x = x + 1;
    end
    
    for dup=1:i(1)
        % duplication des colonnes
        left = img_dup(:,1);
        img_dup = [left img_dup(:,1:y)];
        y = y + 1;
        right = img_dup(:,y);
        img_dup = [img_dup right];
        y = y + 1;
    end
end

