I = imread('cameraman.tif'); 
I_double = im2double(I);
I_ft = fft2(I_double);

% Desplazamiento de la imagen resultante de la transformada
ft_shift = fftshift(I_ft);

% Resultado de la imagen resutado de la FFT en niveles de gris
figure, subplot(1,2,1), imshow(abs(ft_shift),[]), title('mapeado directo');

% Muestra el espectro de la imagen en escala logaritmica
figure, subplot(1,2,2), imshow(log(1+abs(ft_shift)),[]), title('Remap logarítmico')

close all

% Generar matriz de distancia del mismo tamaño que la imagen 
[M, N] = size(I); 
D = distmatrix(M,N);



