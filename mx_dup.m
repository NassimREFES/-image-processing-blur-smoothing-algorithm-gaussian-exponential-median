% duplication function
function M=mx_dup(M,size_h)
        tag=fix((size_h-1)/2); % get nombre de lig/col à ajouter
        ncol=size(M,2); % nbre colones
        nlin=size(M,1); % nbre lignes
        %RGB=size(M,3);
        for i=1:tag
            temp=M(:,1); % extraire 1er colone
            M=[temp , M(:,1:ncol)]; % dupliquer coté droite

            temp=M(1,:); % extraire 1ere ligne
            M=[temp ; M(1:nlin ,:)]; % dupliquer cote haut

            temp=M(nlin,:); % extraire dernier ligne 
            M=[M;temp]; % dupliquer coté bas

            temp=M(:,ncol); % extraire dernier colones 
            M=[M,temp]; % dupliquer dernier colone
        end
end