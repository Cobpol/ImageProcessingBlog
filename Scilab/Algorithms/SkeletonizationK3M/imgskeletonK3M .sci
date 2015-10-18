 // SKELETONIZATION - Algorithm based on work:
// K3M: A UNIVERSAL ALGORITHM FOR IMAGE SKELETONIZATION AND A REVIEW OF THINNING TECHNIQUES. K. Saeed et. al., Int. J. Appl. Math. Comput. Sci., 2010, Vol. 20, No. 2, 317–335 DOI: 10.2478/v10006-010-0024-4
// Scilab implementation: Szymon Moliński (ARDiS, Blue Dot Solutions Ltd.), imgsimon.blogspot.com, molinski.szymon@gmail.com
// Algorithm based on GNU license - feel free to use and share!

// Input Matrix: binary image, white background, black features.

function [skelet]=IMGSKELETON(img)
// Array for detecting borders on image
A0=[3,6,7,12,14,15,24,28,30,31,48,56,60,62,63,96,112,120,124,126,127,129,131,135,143,159,191,192,193,195,199,207,223,224,225,227,231,239,240,241,243,247,248,249,251,252,253,254];
A0_s=size(A0);
dlugosc_A0=A0_s(2);
// Array for deleting pixels with 3 sticking neighbours
A1=[7,14,28,56,112,131,193,224];
A1_s=size(A1);
dlugosc_A1=A1_s(2);
// Array for deleting pixels with 3 or 4 sticking neighbours
A2=[7,14,15,28,30,56,60,112,120,131,135,193,195,224,225,240];
A2_s=size(A2);
dlugosc_A2=A2_s(2);
// Array for deleting pixels with 3,4,5 sticking neighbours
A3=[31,62,124,143,199,227,241,248,7,14,15,28,30,56,60,112,120,131,135,193,195,224,225,240];
A3_s=size(A3);
dlugosc_A3=A3_s(2);
// Array for deleting pixels with 3,4,5,6 sticking neighbours
A4=[63,126,159,207,231,243,249,252,31,62,124,143,199,227,241,248,7,14,15,28,30,56,60,112,120,131,135,193,195,224,225,240];
A4_s=size(A4);
dlugosc_A4=A4_s(2);
// Array for deleting pixels with 3,4,5,6,7 sticking neighbours
A5=[191,239,251,254,63,126,159,207,231,243,249,252,31,62,124,143,199,227,241,248,7,14,15,28,30,56,60,112,120,131,135,193,195,224,225,240];
A5_s=size(A5);
dlugosc_A5=A5_s(2);
// Weight Matrix
W=[128,1,2;64,0,4;32,16,8];
// Calculations
I=double(img);
I_size=size(I);
for i=1:1:I_size(1)
for j=1:1:I_size(2)
if I(i,j)>0 then
I(i,j)=1
end
end
end

I=1-I;
time=1;

// Creating of borders on image

while time>0
time=time-1;
for i=2:1:I_size(1)-1
for j=2:1:I_size(2)-1
if I(i,j)==1 then
Check_sum=0;
W0=W;
Check_matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);
I(i,j-1),0,I(i,j+1);
I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
x=0;
for m=1:1:3
for n=1:1:3
if Check_matrix(m,n)>0 then
W0(m,n)=W0(m,n)
else
W0(m,n)=0
end
end
end
Check_sum=sum(W0);
for o=1:1:dlugosc_A0
if Check_sum==A0(1,o) then
x=x+1;
end
end
if x>0 then
I(i,j)=2
end
end
end
end

// Deleting pixels with 3 neighbors

for i=2:1:I_size(1)-1
for j=2:1:I_size(2)-1
if I(i,j)==2 then
Check_sum=0;
W0=W;
Check_matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);
I(i,j-1),0,I(i,j+1);
I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
x=0;
for m=1:1:3
for n=1:1:3
if Check_matrix(m,n)>0 then
W0(m,n)=W0(m,n)
else
W0(m,n)=0
end
end
end
Check_sum=sum(W0);
for o=1:1:dlugosc_A1
if Check_sum==A1(1,o) then
x=x+1;
time=time+1;
end
end
if x>0 then
I(i,j)=0
end
end
end
end

// Deleting pixels with 3,4 neighbors

for i=2:1:I_size(1)-1
for j=2:1:I_size(2)-1
if I(i,j)==2 then
Check_sum=0;
W0=W;
Check_matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);
I(i,j-1),0,I(i,j+1);
I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
x=0;
for m=1:1:3
for n=1:1:3
if Check_matrix(m,n)>0 then
W0(m,n)=W0(m,n)
else
W0(m,n)=0
end
end
end
Check_sum=sum(W0);
for o=1:1:dlugosc_A2
if Check_sum==A2(1,o) then
x=x+1;
time=time+1;
end
end
if x>0 then
I(i,j)=0
end
end
end
end

// Deleting pixels with 3,4,5 neighbors

for i=2:1:I_size(1)-1
for j=2:1:I_size(2)-1
if I(i,j)==2 then
Check_sum=0;
W0=W;
Check_matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);
I(i,j-1),0,I(i,j+1);
I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
x=0;
for m=1:1:3
for n=1:1:3
if Check_matrix(m,n)>0 then
W0(m,n)=W0(m,n)
else
W0(m,n)=0
end
end
end
Check_sum=sum(W0);
for o=1:1:dlugosc_A3
if Check_sum==A3(1,o) then
x=x+1;
time=time+1;
end
end
if x>0 then
I(i,j)=0
end
end
end
end

// Deleting pixels with 3,4,5,6 neighbors

for i=2:1:I_size(1)-1
for j=2:1:I_size(2)-1
if I(i,j)==2 then
Check_sum=0;
W0=W;
Check_matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);
I(i,j-1),0,I(i,j+1);
I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
x=0;
for m=1:1:3
for n=1:1:3
if Check_matrix(m,n)>0 then
W0(m,n)=W0(m,n)
else
W0(m,n)=0
end
end
end
Check_sum=sum(W0);
for o=1:1:dlugosc_A4
if Check_sum==A4(1,o) then
x=x+1;
time=time+1;
end
end
if x>0 then
I(i,j)=0
end
end
end
end

// Deleting pixels with 3,4,5,6,7 neighbours

for i=2:1:I_size(1)-1
for j=2:1:I_size(2)-1
if I(i,j)==2 then
Check_sum=0;
W0=W;
Check_matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);
I(i,j-1),0,I(i,j+1);
I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
x=0;
for m=1:1:3
for n=1:1:3
if Check_matrix(m,n)>0 then
W0(m,n)=W0(m,n)
else
W0(m,n)=0
end
end
end
Check_sum=sum(W0);
for o=1:1:dlugosc_A5
if Check_sum==A5(1,o) then
x=x+1;
time=time+1;
end
end
if x>0 then
I(i,j)=0
end
end
end
end

// Change to "1 - ones"

for i=1:1:I_size(1)
for j=1:1:I_size(2)
if I(i,j)>0 then
I(i,j)=1
end
end
end
if time>0 then
time=1
else
time=0
end
end

I=1-I;
skelet=I;

endfunction
