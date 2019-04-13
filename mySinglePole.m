function [outputvector] = mySinglePole(inputvector, alpha)
 n=length(inputvector);
 outputvector=zeros(n,1);
 for i=2:n
   outputvector(i) = (1-alpha)*inputvector(i)+alpha*outputvector(i-1);
 end
 outputvector(1)=(1-alpha)*inputvector(1);
 






 