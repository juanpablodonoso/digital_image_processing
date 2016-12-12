%% HIGH-PASS FILTERING
% * Attenuate the low-frequency components of the Fourier Transform of an image
% * Enhancing hight-frequency components or leaving them unchanged
% * Overall effect :  controlled degree of sharpening



%% Implemntacion of High-Pass Filtering 
% Important: High-pass filter attenuates low frequency, so zero-frequency term will be
% set to zero, setting the average value of the image to zero. It's
% necessary to use _high-frequency emphasis filtering_ . 

IDouble = im2double(imread('eight.tif')); 
I_ft = fft2(IDouble);   
I_ft_shif = fftshift(I_ft);  % Fourier transform of original image

figure, imshow(log(1+abs(I_ft_shif)),[]), title('FT of original'); 

% Generate a distance matrix
[X,Y] = size(IDouble); 
center_dist_matrix = distmatrix(X, Y); 


%% Ideal HPF
% Idea: atteanuates all frequency components wihtin a specified radius (D_0 or cutoff frequency) from
% the center of the FT while enhnacing others
% Being (u,v) a point of coordinates and D(u,v) = sqrt((u.^2)+(v.^2)) the
% distance between the point and the origin of 2D frequency plan
% H_I(u,v) = (0 if D(u,v) <= radius ) || (1 if D(u,v) > radius)

H_I = ones(X,Y); 
radius = 30; 
off_radius_ind = center_dist_matrix <= radius; 
H_I(off_radius_ind) = 0;  % o if D(u,v) <= radius

% hight-frequency emphasis filtering 
a = 1; b = 1; 
HDouble = double(a + (b.*H_I));

% apply the filter (stored in HDouble) to I_ft 
FT_filt = HDouble .* I_ft; 
I_IdealHPF = real(ifft2(FT_filt)); 

figure, imshow(log(1+abs(ifftshift(FT_filt))),[]),title('Filtered FT');
figure, imshow(I_IdealHPF), title('Filtered Image'); 

%% filer as 3D mesh 
figure, imshow(fftshift(HDouble),[]), title('Filter as image'); 

figure, mesh(fftshift(HDouble)), zlim([0,2]),title('Filter as a mesh'); 

%% Gaussian HPF
% The behavior of the filter will be controlled with the value of the
% standard desviation sigma. 
sigma = 30; 
% The H_G(u,v) transfer function (Gaussian curve) is:
H_G = 1 - exp(-(center_dist_matrix .^2) / (2*(sigma^2)));

H_G_hfe = a + (b .* H_G); % apply high-frequency emphasis filtering
figure, mesh(fftshift(H_G_hfe)), title('Gaussian hight-pass filter'); 

%% Aply the gaussian filter to the FT image
FT_filt_gau = H_G_hfe .* I_ft; % convolution 
I_Gaussian_HPF = real(ifft2(FT_filt_gau)); 
figure, imshow(log(1+abs(fftshift(I_ft))),[]), title('Original FT'); 
figure, imshow(log(1+abs(fftshift(FT_filt_gau))),[]), title('FT of original image filtered whit GaussianHPF');
figure, imshow(I), title('Original image'); 
figure, imshow(I_Gaussian_HPF), title('Original image filtered with GaussianHPF');














