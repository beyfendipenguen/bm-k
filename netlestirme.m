clear all;
A=imread ('D:\dersler\BMOK-I\kodlar\Safari_RGB.jpg');
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

orj_R=double(A(:,:,1));
orj_G=double(A(:,:,2));
orj_B=double(A(:,:,3));
cnv=[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];



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
 
 Ablnk(i,j,1)=B_R;
 Ablnk(i,j,2)=B_G;
 Ablnk(i,j,3)=B_B;
 
end
end


for i=1:sat
  for j=1:sut
  R_ek=A(i,j,1)-Ablnk(i,j,1);
  G_ek=A(i,j,2)-Ablnk(i,j,2);
  B_ek=A(i,j,3)-Ablnk(i,j,3);
  
  Anet(i,j,1)=A(i,j,1)+R_ek;
  if Anet(i,j,1)>255 Anet(i,j,1)=255; end;
  if Anet(i,j,1)<0 Anet(i,j,1)=0; end;
  
  Anet(i,j,2)=A(i,j,2)+G_ek;
  if Anet(i,j,2)>255 Anet(i,j,2)=255; end;
  if Anet(i,j,2)<0 Anet(i,j,2)=0; end;
  
  Anet(i,j,3)=A(i,j,3)+B_ek;
  if Anet(i,j,3)>255 Anet(i,j,3)=255; end;
  if Anet(i,j,3)<0 Anet(i,j,3)=0; end;
  
 
  end
end

% imshow(Anet);
% imshow(Ablnk);
imwrite(Anet,'D:\dersler\BMOK-I\kodlar\ders10_1.jpg');