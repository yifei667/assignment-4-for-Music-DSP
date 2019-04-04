function [outputvector] = mySinglePole(inputvector, alpha)
 n=length(inputvector);
 for i=2:n
   outputvector(i) = (1-alpha)*inputvector(i)+alpha*outputvector(i-1);
 end
 outputvector(1)=inputvector(1);
 






 