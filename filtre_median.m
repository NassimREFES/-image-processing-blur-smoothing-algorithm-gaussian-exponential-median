clc;
clear all;

x = 3;
y = 3;

if mod(x*y, 2) == 0
    disp( sprintf('[%d %d] doit etre impair\n',x, y));
end

direction = ones(x, y);

img = imread('C:\Program Files\MATLAB\R2009a\toolbox\images\imdemos\cameraman.tif');
%img = [3 93 4 ; 1 5 6; 4 4 4];

[xx yy zz] = size(img);
xx
yy
zz
% tout les matrices
img_r = img(:, :, 1);
if zz == 3
  img_g = img(:, :, 2);
  img_b = img(:, :, 3);
end

% choix de l effet de bord
choix_bord = input('');

T = [(x-1)/2; (y-1)/2];

if choix_bord == 1 % effet de bord duplication
    img_r2 = duplication(img_r, T);
    if zz == 3
      img_g2 = duplication(img_g, T);
      img_b2 = duplication(img_b, T);
    end
elseif choix_bord == 2 % effect de bord zero padding
    img_r2 = zero_padding(img_r, T); 
    if zz == 3
      img_g2 = zero_padding(img_g, T); 
      img_b2 = zero_padding(img_b, T); 
    end
end


%img
%img_avec_bord
%img_r2

figure(1) : imshow(img);

img_r = appliquer_filtre_median(img_r, img_r2, T, direction);
if zz == 3
      img_g = appliquer_filtre_median(img_g, img_g2, T, direction);
      img_b = appliquer_filtre_median(img_b, img_b2, T, direction);
end
%img_r

 img(:,:,1) = img_r;
 if zz == 3
   img(:, :, 2) = img_g;
   img(:, :, 3) = img_b;
 end

figure(2) : imshow(img);

