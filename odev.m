banknot = imread("resim11.jpg");

gri = rgb2gray(banknot);

brightw= gri<30; 
imshow(brightw);
brightw1 = imcomplement(brightw); 

morph = strel("square",6); 
opening = imopen(brightw1,morph);
Imfilled = imfill(opening, "hole"); 
imwrite(Imfilled,"r1.jpg");
label= bwlabel(Imfilled);

sat=size(Imfilled)*[1;0];
sut=size(Imfilled)*[0;1];


banknotbul=[0,0,0];
toplam=0;
for l=1:max(max(label))
  imglabel=(label==l);
  banknotbul=[0,0,0];
  for i=1:sat
    if banknotbul(1)>5 || banknotbul(2)>5 || banknotbul(3)>5
      if banknotbul(1)>5
        toplam+=100;
      endif
      if banknotbul(2)>5
        toplam+=20;
      endif
      if banknotbul(3)>5
        toplam+=50;
      endif
      break;  
    endif
    for j=1:sut
      if imglabel(i,j)==1
        %100
        if (banknot(i,j,1)<115 && banknot(i,j,1)>107) && (banknot(i,j,2)<80 && banknot(i,j,2)>75) && (banknot(i,j,3)>49 && banknot(i,j,3)<55 ) 
          banknotbul(1)+=1;
        endif
        %20
        if banknot(i,j,1)<136 && banknot(i,j,1)>132 && banknot(i,j,2)<88 && banknot(i,j,2)>83 && banknot(i,j,3)>37 && banknot(i,j,3)<42  
          banknotbul(2)+=1;
        endif
        %50
        if banknot(i,j,1)<140 && banknot(i,j,1)>136 && banknot(i,j,2)<70 && banknot(i,j,2)>65 && banknot(i,j,3)>13 && banknot(i,j,3)<17  
          banknotbul(3)+=1;
        endif
       endif
    endfor
  endfor
endfor
printf("%d \n",toplam);
