banknot = imread("banknot3.jpeg");

gri = rgb2gray(banknot);

brightw= gri<85; 
brightw = imcomplement(brightw); 

morph = strel("square",6); 
opening = imopen(brightw,morph);
Imfilled = imfill(opening, "hole"); 

area = bwperim(banknot,4);
imwrite(area,"region.jpeg");
sat=size(Imfilled)*[1;0];
sut=size(Imfilled)*[0;1];
A=ones(sat,sut,3);
A=A.*0;
A=uint8(A);

for i=1:sat

for j=1:sut
  if Imfilled(i,j) == 1
    A(i,j,1) = banknot(i,j,1);
    A(i,j,2) = banknot(i,j,2);
    A(i,j,3) = banknot(i,j,3);
   end
 
end
end
imwrite(A,"yeni1.jpeg");