function e=intersection(mat1,mat2)
[l1 c1]=size(mat1);
[l2 c2]=size(mat2);
mat11 = imresize(mat1, [min(l1,l2) min(c1,c2)]);
mat22 = imresize(mat2, [min(l1,l2) min(c1,c2)]);
d=zeros(size(mat11,1),size(mat11,2));
for i=1:size(mat11,1);
   for j=1:size(mat11,2);
     if (mat11(i,j)==1) & (mat22(i,j)==1) 
       d(i,j)=1;
     else d(i,j)=0;
     end;
   end;
 end;
end