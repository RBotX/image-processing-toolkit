close all
clear all
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc � binariser :');
if ~Image
   error('Aucun fichier n''a �t� d�sign� !')
end
kappa      = 0.2;

I         = imread(Image);
if length(size(I))==3
   I = rgb2gray(I);
end
M           = I;
%--------------- millieu des pixels ------------
Imin = min(min(I));
Imax = max(max(I));
%----------// Calcul du seuil par la methode de Berson //-----------------
Milieu = (Imin+Imax)/2;

ImNilback = zeros(size(I)); % allocation

I = im2uint8(I(:)); % ecrire la matrice comme un vect
[counts,N]=imhist(I); % histogramme de I, N= indice, counts = effctifs de N
Somcum = cumsum(counts);
mu     = sum(N.*counts)/Somcum(end);% mu(end) = mu(255)=mu(lenght(mu)
ecartType = std(I);


% D�termination du seuil %
 
seuil        = mu + (1+ kappa*(ecartType/Milieu)-1);
% BINARISATION %
ImNilback( M > seuil ) = 1;

%Visualisation
subplot(1,2,1)
image_initiale=imshow(M);
title('Image de depart ');
subplot(1,2,2)
imshow(ImNilback);
title('Image noir en blanc par Sauvola');
