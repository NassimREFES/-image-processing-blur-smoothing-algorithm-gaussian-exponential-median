%  img = [ 10 20 30 15 50 60 70;
%          10 20 30 40 50 60 70;
%          15 20 30 40 50 60 15;
%          10 20 30 40 50 60 70;
%          10 20 30 15 50 60 70];
%     img = [ 200*ones(3, 3) zeros(3, 3);
%         zeros(3, 3) 200*ones(3, 3)];

img = imread('/usr/local/MATLAB/R2013a/toolbox/images/imdemos/html/ipexblind_02.png');
% img = imread('/home/neys/Bureau/femme.jpg');
[x y z] = size(img);
x
y
z
img_r = img(:, :, 1);
if z == 3
  img_g = img(:, :, 2);
  img_b = img(:, :, 3);
end

% noyau de convolution
sz_noyau_x = 3;
sz_noyau_y = 3;
if mod(sz_noyau_x*sz_noyau_y, 2) == 0
    disp( sprintf('le noyau utiliser[%d %d] doit etre impair\n',sz_noyau_x, sz_noyau_y));
end
    
%noyau = 1/100*ones(sz_noyau_x, sz_noyau_y);
noyau = 1/9*[ -1 -1 -1; -1 8 -1; -1 -1 -1];
noyau

figure(1) : imshow(img); %colormap(gray);

% duplication de l'image

% nombre de duplication
sz_duplication = [ (sz_noyau_x-1)/2; (sz_noyau_y-1)/2 ];
img2_r = duplication(img_r, sz_duplication);
if z == 3
  img2_g = duplication(img_g, sz_duplication);
  img2_b = duplication(img_b, sz_duplication);
end

debut = [(sz_noyau_x+1)/2; (sz_noyau_y+1)/2];

debut(1)
debut(2)

% application du filtre de moyenne sur l'image
 img_r = applique_le_filtre(img_r, img2_r, debut, noyau);
 if z == 3
     img_g = applique_le_filtre(img_g, img2_g, debut, noyau);
     img_b = applique_le_filtre(img_b, img2_b, debut, noyau);
 end
 
 img(:,:,1) = img_r;
 if z == 3
   img(:, :, 2) = img_g;
   img(:, :, 3) = img_b;
 end


% %img2_r
% imshow(img); %colormap(gray)
figure(2) : imagesc(img); colormap(gray);