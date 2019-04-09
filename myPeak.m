function outputvector = myPeak(inputvector, freqvalue, qvalue, gain, samplerateinHz)
  omega=2*pi*freqvalue/samplerateinHz;
  alpha= sin(omega)/(2*qvalue);
  A=10^(gain/40);
  b0=1+alpha*A;
  b1=-2*cos(omega);
  b2=1-alpha*A;
  a0=1+alpha/A;
  a1=-2*cos(omega);
  a2=1-alpha/A;
  a=[a0,a1,a2];
  b=[b0,b1,b2];
  outputvector=filter(b,a,inputvector);
  
end
