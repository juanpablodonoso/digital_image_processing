%% Procesamiento basado en vecino - puntos fundamentales 
% * Definir pto de referencia f(x_0, y_0)
% * Realizar operación que involucre sólo a pixeles vecinos de entrada
% * Almacenar en g(x_0, y_0) el resultado 
% * Repetir proceso para todos los puntos de la imagen 

%% Convolution 

a = [0 0 0 1 0 0 0]; 
f = [1 2 3 4 5]; 

g = imfilter(a,f,'full','conv')
% g = imfilter(a,f,'same', 'conv') %  0     1     2     3     4     5     0
h = imfilter(a,f,'full','corr')


%% Correlación entre dos matrices 
x = [140 108 94; 89 99 125; 121 134 221]
y = [-1 0 1; -2 0 2;-1 0 1]
z = imfilter(x,y,'corr')

z2 = imfilter(x,y,'conv')



