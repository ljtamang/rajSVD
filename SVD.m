% Author: Lasang Jimba Tamang
% This program takes the images under same scene but different light illuminations
% as inputs. Then, it uses SVD to create different possible images.

% Step 1: Read images and form data matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.1 Read images as  matrix
I1_mat = imread('image1.jpg'); % returns 960 X 1280 matrix
I2_mat = imread('image2.jpg');
I3_mat = imread('image3.jpg');
% 1.2 Convert each matrix as column vector
a1_vec = I1_mat(:); 
a2_vec = I2_mat(:);
a3_vec = I3_mat(:); 
% 1.3 Put all column vector toghether to form a matrix
A = [a1_vec, a2_vec, a3_vec]; % Form data matrix
A = double(A);

% Step 2: Apply SVD to get basis of A. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We appy reduced SVD to obtain U, SIGMA and V. 
% Here, U is a basis of A. This mean some linear combinations
% of U gives new possible images
[U, SIGMA, V] = reduced_SVD(A);


% Step 3: Use basis U obtaed from step 2 to produce new possible images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Form 6 new images using basis and save them
produce_new_images_using_basis(6, U, size(imread('image1.jpg')));


% Function to implement reduced SVD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For more info about SVD alogrithm, refer to slide reduced_svd 
% along this code file
function [U, SIGMA, V] = reduced_SVD(A)
    % Input:  Matrix A of size m*n,m>n
    % Output: U, SIGMA, V
    % U: size m*n, column of U are called left singualr vectors of A
    % SIGMA: diagonal matrix of size n*n, diagonal entries of Sigma
    % are called singular values of A
    % V: size n*n, column of V are called left singualr vectors A
    
    C = transpose(A)*A;
    [V, SIGMA] = eig(C);
    sigma = sqrt(eig(C)); % sigma elementare sqrt of diogonal element
    
    [m, n] = size(A); 
    U = zeros(m,n); 
    for column_no = 1 : n 
        U(:,column_no) = A*V(:,column_no)./sigma(column_no);
    end 
end

% Function that produces new iamges given basis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = produce_new_images_using_basis(no_of_images, basis, imagze_size) 
% Input:
    % no_of_images: how many new images should be produced
    % imagze_size: Give the dimension of orginal images so that the program
    %               can reconstruct image of same size
% Output: produce and saves images
   [no_of_row, no_of_column] = size(basis);
    for count= 1 : no_of_images
        coeff  = randperm(1500,no_of_column); % create rabdin coefficeints
        new_image_vec= zeros(no_of_row, 1);
        for n = 1 : no_of_column
            new_image_vec = new_image_vec + coeff(n)*basis(:,n);
        end
        new_image_matrix = reshape(new_image_vec,imagze_size);
        imwrite(new_image_matrix, ['simulated_image_' num2str(count) '.jpg']);
    end
end

