% rnek dosyann 3x3 konvolsyon ile Gauss ortalamasn alan fonksiyon

clear all;
A = imread ('\Users\Recai\Desktop\kodlar\Safari_RGB.jpg');
sat=size(A)*[1;0;0];
sut=size(A)*[0;1;0];

for i=1:sat

for j=1:sut
 B(i+1,j+1,:)=A(i,j,:);
 	if i==1
	B(1,j,:)=A(1,j,:);
	end
	if i==sat
	B(sat+2,j+1,:)=A(sat,j,:);
	end
	
	if j==1
	B(i+1,1,:)=A(i,1,:);
	end
	if j==sut
	B(i+1,sut+2,:)=A(i,sut,:);
	end
end
end
B(1,1,:)=A(1,1,:);
B(sat+2,1,:)=A(sat,1,:);
B(1,sut+2,:)=A(1,sut,:);
B(sat+2,sut+2,:)=A(sat,sut,:);

A=0;
A=B;

renkler[kirmizi=double(A(:,:,1)); ,
yesil=double(A(:,:,2)); ,
mavi=double(A(:,:,3)); ]
cnv=[1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];



for i=1:sat
for j=1:sut
 tmp=[orj_R(i,j) orj_R(i,j+1) orj_R(i,j+2) ;
 orj_R(i+1,j) orj_R(i+1,j+1) orj_R(i+1,j+2) ; 
 orj_R(i+2,j) orj_R(i+2,j+1) orj_R(i+2,j+2) ];
 B_R=uint8( sum(sum(tmp.*cnv)) );
 
 tmp=[orj_G(i,j) orj_G(i,j+1) orj_G(i,j+2) ;
 orj_G(i+1,j) orj_G(i+1,j+1) orj_G(i+1,j+2) ; 
 orj_G(i+2,j) orj_G(i+2,j+1) orj_G(i+2,j+2) ];
 B_G=uint8( sum(sum(tmp.*cnv)) );
 
  tmp=[orj_B(i,j) orj_B(i,j+1) orj_B(i,j+2) ;
 orj_B(i+1,j) orj_B(i+1,j+1) orj_B(i+1,j+2) ; 
 orj_B(i+2,j) orj_B(i+2,j+1) orj_B(i+2,j+2) ];
 B_B=uint8( sum(sum(tmp.*cnv)) );
 
 Anew(i,j,1)=B_R;
 Anew(i,j,2)=B_G;
 Anew(i,j,3)=B_B;
 
end
end

% imshow(Anew);
imwrite(Anew,'\Users\Recai\Desktop\kodlar\ders6_1.jpg');