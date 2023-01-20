%%%% Q2A %%%%
clear;

% Read an image in RGB scale
% RGB is a 1359x1597x3 matrix
RGB=imread('sample1.jpg');

% Transform from RGB to gray scale
% GR is a 1359x1597 matrix
GR=rgb2gray(RGB);

% Read numbers of the gray scale for each pixel
% Converts matrix of class uint8 to double 
A=im2double(GR);

% Flip the matrix upside/down for correct reading
% A=flipud(A);
% Not necessary for imshow

%%%% Q2B %%%%

% Singular value decomposition
% U is matrix size 1359x1359, V is matrix size 1597x1597
% S is matrix size 1359x1597
[U,S,V] = svd(A);
[M,N] = size(S);
% Let i = 1,2,10,100,500,1000
j = [1,2,10,100,500,1000];
for i = j
    u_i = U(:,i); v_i = V(:,i);
    A_i = u_i*v_i';
    figure(1)
    subplot(3,2,find(j==i)), imshow(A_i,[])
    title(sprintf('A_{%d}',i))
    hold on
    shading interp
end

%%%% Q2C %%%%

% Let l = 1,2,5,10,50,100 for rank-k approximation
k = [1,2,5,10,50,100];
for l = k
    a = zeros(M,N);
    for i = 1:l
        u = U(:,i);
        v = V(:,i);
        s = S(i,i);
        a = a + s*u*v';
    end
    figure(2)
    subplot(3,2,find(k==l)), imshow(a,[])
    title(sprintf('rank-%d approximation',l))
    hold on
    shading interp
end
