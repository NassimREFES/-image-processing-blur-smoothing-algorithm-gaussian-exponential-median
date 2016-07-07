function nH = exponentiel_noyau(n, m, gamma)
	debut = [(n-1)/2 (m-1)/2];
	noyau = ones(n, m);
	ii = 1;
	for i=-debut(1):debut(1)
		jj = 1;
		for j=-debut(2):debut(2)
			noyau(ii, jj) = exp( -gamma*(abs(i)+abs(j)) );
			jj = jj + 1;
		end
		ii = ii + 1;
	end

	nH = ((gamma*gamma)/4) * noyau;
end