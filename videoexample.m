% A sample script, which shows the usage of functions, included in
% PCA-based face recognition system (Eigenface method)
%
% See also: CREATEDATABASE, EIGENFACECORE, RECOGNITION


clear all
clc
close all

% You can customize and fix initial directory paths
TrainDatabasePath = uigetdir( pwd, 'Select training database path' );
video = videoinput('winvideo',1);
set( video, 'ReturnedColorspace', 'RGB');
k = getsnapshot(video);
imwrite(k,'TestImage.jpg');
TestImage = strcat(pwd,'\','TestImage.jpg');

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

imshow(TestImage);
title('Picture Clicked');
figure,imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
delete 'TestImage.jpg';