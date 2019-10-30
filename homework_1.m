%%%Homework 1 

%open Image
image_1=imread('./Images/Image_1.jpg');
image_2=imread('./Images/Image_2.jpg');
image_3=imread('./Images/Image_3.jpg');


%% Question 1
%convert to grayscale

image1_gray=rgb2gray(image_1);
%imshow(image1_gray)

%% Question 2

%imhist(image1_gray);
%% Question 3
gray_threshold=image1_gray>=125;
%imshow(gray_threshold)
%% Question 4
kernel = [0.003 0.013 0.022 0.013 0.003;
    0.013 0.059 0.097 0.059 0.013;
    0.022 0.097 0.159 0.097 0.022;
    0.013 0.059 0.097 0.059 0.013;
    0.003 0.013 0.022 0.013 0.003;];
gausian=conv2(image1_gray,kernel,'same');
%imshow(gausian)


%% Question 5
[Gx, Gy] = imgradientxy(image1_gray,'sobel');
%imshowpair(Gx,Gx)

%% Question 6

image2_gray=rgb2gray(image_2);
image3_gray=rgb2gray(image_3);

diff= abs(image2_gray-image3_gray);
%imshow(diff>=40)

%% Question 7
%canny_edge = edge(image2_gray,'sobel');
%imshow(canny_edge)

%% Question 8
[gx,gy]= gradient(double(image1_gray)); 
gxx=gx.*gx;
gyx=gy.*gx;
gyy=gy.*gy;

M=[sum(gxx) sum(gyx);sum(gyy) sum(gyx);];



