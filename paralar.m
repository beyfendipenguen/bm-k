banknot = imread("kırmızı1.jpg");

gri = rgb2gray(banknot);

brightw= gri<50; 

brightw1 = imcomplement(brightw); 

morph = strel("square",5); 
opening = imopen(brightw1,morph);
Imfilled = imfill(opening, "hole"); 
label= bwlabel(Imfilled);

sat=size(Imfilled)*[1;0];
sut=size(Imfilled)*[0;1];


banknotbul=[0,0,0];
toplam=0;
for l=1:max(max(label))
  imglabel=(label==l);
  banknotbul=[0,0,0];
  for i=1:sat
    if banknotbul(1)>10 || banknotbul(2)>10 || banknotbul(3)>10
      if banknotbul(1)>10
        toplam+=50;
      elseif banknotbul(2)>10
        toplam+=10;
      elseif banknotbul(3)>10
        toplam+=20;
      endif
      break;  
    endif
    for j=1:sut
      if imglabel(i,j)==1
        %50
        if banknot(i,j,1)<161 && banknot(i,j,1)>153 && banknot(i,j,2)<123 && banknot(i,j,2)>117 && banknot(i,j,3)>61 && banknot(i,j,3)<68  
          banknotbul(1)+=1;
        %10
        endif
        if banknot(i,j,1)<159 && banknot(i,j,1)>153 && banknot(i,j,2)<99 && banknot(i,j,2)>94 && banknot(i,j,3)>66 && banknot(i,j,3)<71  
          banknotbul(2)+=1;
        %20
        endif
        if banknot(i,j,1)<136 && banknot(i,j,1)>130 && banknot(i,j,2)<140 && banknot(i,j,2)>133 && banknot(i,j,3)>94 && banknot(i,j,3)<99  
          banknotbul(3)+=1;
       endif
       endif
    endfor
  endfor
endfor
printf("resimde %d tl vardır.\n",toplam);
