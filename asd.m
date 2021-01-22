banknot = imread("paralar1.jpg");

gri = rgb2gray(banknot);

gri = gri>252   ;
ters = imcomplement(gri);
imwrite(ters,"gribuyuk230s.jpg");
