function outputvector=my2ndorder(inputvector,freqvalue, qvalue, gain, samplerateinHz)
  omega=2*pi*freqvalue/samplerateinHz;
  alpha= sin(omega)/(2*qvalue);
  A=10^(gain/40);
  b0=1+alpha*A;
  b1=-2*cos(omega);
  b2=1-alpha*A;
  a0=1+alpha/A;
  a1=-2*cos(omega);
  a2=1-alpha/A;
  n=length(inputvector);
  outputvector=zeros(n,1);
  for i=3:n
      outputvector(i) = b0/a0*inputvector(i)+b1/a0*inputvector(i-1)+b2/a0*inputvector(i-2)-a1/a0*outputvector(i-1)-a2/a0*outputvector(i-2);
  end
  outputvector(2)=b0/a0*inputvector(2)+b1/a0*inputvector(1)-a1/a0*outputvector(1);
  outputvector(1)=b0/a0*inputvector(1);    
end 