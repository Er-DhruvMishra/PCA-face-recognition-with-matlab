% A sample script, which shows the usage of functions, included in
% PCA-based face recognition system (Eigenface method)
%
% See also: CREATEDATABASE, EIGENFACECORE, RECOGNITION


clear all
clc
close all

% You can customize and fix initial directory paths
TrainDatabasePath = uigetdir('pwd/traindb', 'Select training database path' );
%TestDatabasePath = uigetdir('~', 'Select test database path');

%prompt = {'Enter test image name (a number between 1 to 10):'};
%dlg_title = 'Input of PCA-Based Face Recognition System';
%num_lines= 1;
%def = {'1'};

%TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
%TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
[filename, pathname] = uigetfile('*.jpg', 'Select a test image file');
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(['User selected : ', fullfile(pathname, filename)])
end
TestImage=strcat(pathname,filename);
im = imread(TestImage);
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);
imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
