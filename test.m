clear all;
close all;
clc;

k=2;

image_gnd = imread('gnd.bmp');
gnd_size = size(image_gnd);
image = zeros([gnd_size(1:2)/k,gnd_size(3)]);
image_size_gray = size(image(:,:,1));
image_gnd_ycbcr = rgb2ycbcr(uint8(image_gnd));
image_gnd_gray= image_gnd_ycbcr(:,:,1);
for i=1:3
    image(:,:,i) = imresize(image_gnd(:,:,i),image_size_gray);
end
image_ycbcr = rgb2ycbcr(uint8(image));
input_image = image_ycbcr(:,:,1);
% figure(1);
% imshow(uint8(input_image));

% Y = waveletbased_sr_grayimage( input_image,k );
%% С����С����任����
scale = 1;
% fu = wavelet1_scale_func( input_image(1,:),scale );
% gu = wavelet1_wavelet_func(input_image(1,:),scale );
% f_inv = wavelet1_inverse_func(gu,fu,scale);

% a=wavelet1_scale_func( input_image(1,:),scale-1 );
% figure;
% subplot(2,1,1);
% plot(a);
% subplot(2,1,2);
% plot(f_inv);

% [ fu,gu_hor,gu_ver] = wavelet2_forward(input_image,scale );
% image_out = wavelet2_inverse( fu,gu_hor,gu_ver,scale );
% figure;
% imshow(uint8(image_out));
%% 
% gu_hor_init = gu_initial( input_image, 'hor');

tic;
result = waveletbased_sr_grayimage( input_image,k );
toc;
display(toc - tic);
figure;
imshow(input_image);
figure;
imshow(result);
figure;
imshow(image_gnd_gray);
