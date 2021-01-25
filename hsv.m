banknot = imread("banknot3.jpeg");

hsv_b= rgb2hsv(banknot);

sat=size(banknot)*[1;0;0];
sut=size(banknot)*[0;1;0];


imwrite(hsv_b,"hsv_b.jpg");