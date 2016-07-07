function nH = gauss_noyau(n, m, sigma)
	debut = [(n-1)/2 (m-1)/2];
	noyau = ones(n, m);
	ii = 1;
	for i=-debut(1):debut(1)
		jj = 1;
		for j=-debut(2):debut(2)
			noyau(ii, jj) = exp(-(i*i+j*j)/(2*sigma*sigma));
			jj = jj + 1;
		end
		ii = ii + 1;
	end

	nH = (1/(2*pi*sigma*sigma)) * noyau;
end 
