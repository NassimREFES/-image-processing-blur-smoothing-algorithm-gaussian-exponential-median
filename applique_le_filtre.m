function img = applique_le_filtre(img, img_dup, debut, noyau)
    [x, y] = size(img_dup);
    sz_noyau = size(noyau);
    tic;
    for i=debut(1):x-debut(1)+1
        for j=debut(2):y-debut(2)+1
           sum_ = double(zeros(1, sz_noyau(1)*sz_noyau(2)));
           ns = 1;
           ni = 1;
           for xi=i-(debut(1)-1):i+(debut(1)-1)
               nj = 1;
               for yj=j-(debut(2)-1):j+(debut(2)-1)
                   sum_(ns) = double(sum_(ns) + img_dup(xi, yj)*noyau(ni, nj));
                   nj = nj + 1;
                   ns = ns + 1;
               end
               ni = ni + 1;
           end
           img(i-(debut(1)-1), j-(debut(2)-1)) = round(sum(sum_));
        end
    end
    toc;
end

