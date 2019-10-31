%%%Homework 1 

%open Image
image_1=imread('./Images/Image_1.jpg');
image_2=imread('./Images/Image_2.jpg');
image_3=imread('./Images/Image_3.jpg');


%% Question 1
%convert to grayscale

image1_gray=rgb2gray(image_1);
figure;
imshow(image1_gray)
title('showing grayscale image of Image 1')
%% Question 2
figure;
imhist(image1_gray);
title('Showing the histogram of Image_1 ')

%% Question 3
gray_threshold=image1_gray>=125;
figure;
imshow(gray_threshold)
title('Showing the thresholded image of Image_1')

%% Question 4
kernel = [0.003 0.013 0.022 0.013 0.003;
    0.013 0.059 0.097 0.059 0.013;
    0.022 0.097 0.159 0.097 0.022;
    0.013 0.059 0.097 0.059 0.013;
    0.003 0.013 0.022 0.013 0.003;];
gausian=conv2(image1_gray,kernel,'same');
figure;
imshow(gausian)


%% Question 5
[Gx, Gy] = imgradientxy(image1_gray,'sobel');
figure;
imshowpair(Gx,Gy)
title('Showing the sobel detector')

%% Question 6
image2_gray=rgb2gray(image_2);
image3_gray=rgb2gray(image_3);
diff= abs(image2_gray-image3_gray);
figure;
imshow(diff>=40)
title('Showing the moving objects the threshold is 40')
%% Question 7
canny_edge = edge(image2_gray,'canny');
figure;
imshow(canny_edge)
title('Dectected Edges Canny method')


%% Question 8
Corners=corner(image2_gray);
figure;
imshow(image_2)
hold on
plot(Corners(:,1),Corners(:,2),'r*');
title('Dectected corners Using the the Harris Detector')
%% Question 9

figure;
[c1,n]=imhist(image1_gray);
[c2,n]=imhist(image2_gray);
[c3,n]=imhist(image3_gray);

d12 =  sum(abs(c1-c2))
d13 = sum(abs(c1-c3))
d23 = sum(abs(c2-c3))

%since distance d12 is the smallest then image 1 and 2 are similar


