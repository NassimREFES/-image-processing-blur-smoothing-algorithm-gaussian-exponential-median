function img = appliquer_filtre_median( img, img_avec_effet, direction )
    [x y] = size(img);
    [xx yy] = size(direction);
    vec = [];
    tic;
    for i=1:x
        for j=1:y
            v = 1;
            for ii=1:xx
                for jj=1:yy
                   vec(v) = img_avec_effet(i+(jj-1), j+(ii-1))*direction(ii, jj);
                   v = v + 1;
                end
            end
            vec = sort(vec); % trie
    
            img(i, j) = vec(ceil((xx*yy)/2)); % prendre la valeur median
        end
    end
    toc;
end

