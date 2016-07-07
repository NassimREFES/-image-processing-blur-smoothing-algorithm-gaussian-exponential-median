function img_mir = mirroir( img_mir, i )
    [x, y] = size(img_mir)
    for dup = 1:i(2)
        % duplication des lignes
        up = img_mir(2,:);
        img_mir = [up; img_mir(1:x,:)];
        x = x + 1;
        bottom = img_mir(x-1,:);
        img_mir = [img_mir; bottom];
        x = x + 1;
    end
    
    for dup=1:i(1)
        % duplication des colonnes
        left = img_mir(:,2);
        img_mir = [left img_mir(:,1:y)];
        y = y + 1;
        right = img_mir(:,y-1);
        img_mir = [img_mir right];
        y = y + 1;
    end
end

