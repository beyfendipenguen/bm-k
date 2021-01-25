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


banknotbul=0;
for l=1:max(max(label))
  imglabel=(label==l);
  banknotbul=0;
  for i=1:sat
    if banknotbul==1
      break;  
    endif
    for j=1:sut
      if imglabel(i,j)==1
        %200
        if (banknot(i,j,1)<103 && banknot(i,j,1)>93) && (banknot(i,j,2)<85 && banknot(i,j,2)>75) && (banknot(i,j,3)>63 && banknot(i,j,3)<73 ) 
          printf("buldum 100 \n");
          banknotbul=1;
          break;
        endif
        if banknot(i,j,1)<136 && banknot(i,j,1)>106 && banknot(i,j,2)<92 && banknot(i,j,2)>82 && banknot(i,j,3)>64 && banknot(i,j,3)<74  
          printf("buldum 20 \n");
          banknotbul=1;
          break;
        endif
        if banknot(i,j,1)<140 && banknot(i,j,1)>136 && banknot(i,j,2)<70 && banknot(i,j,2)>65 && banknot(i,j,3)>13 && banknot(i,j,3)<17  
          printf("buldum 50 \n" );
          banknotbul=1;
          break;
        endif
       endif
    endfor
  endfor
endfor
