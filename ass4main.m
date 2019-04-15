N=44100;
x=rand(N,1);
alpha=0.99;
[outputvector] = mySinglePole(x, alpha);
b =1-alpha;
a =[1,-alpha];
y = filter(b,a,x);
diff=outputvector-y;
figure(1)
plot(diff)
title('difference of the results')
xlabel('number of samples')
ylabel('magnitude')
[cathy_2,fs]=audioread('/Users/yuyifei/Documents/MATLAB/cathy_2.wav');
[filter1] = mySinglePole(cathy_2,0.5);
[filter2] = mySinglePole(cathy_2,0.9);
[filter3] = mySinglePole(cathy_2,0.99);
[filter4] = mySinglePole(cathy_2,0.999);
figure(2)
subplot(2,2,1)
pwelch(filter1)
title('filter(alpha = 0.5)')
subplot(2,2,2)
pwelch(filter2)
title('filter(alpha = 0.9)')
subplot(2,2,3)
pwelch(filter3)
title('filter(alpha = 0.99)')
subplot(2,2,4)
pwelch(filter4)
title('filter(alpha = 0.999)')
audiowrite('filter1.wav',filter1,fs);
audiowrite('filter2.wav',filter2,fs);
audiowrite('filter3.wav',filter3,fs);
audiowrite('filter4.wav',filter4,fs);
figure(3)
alpha1=0.9;
freqz((1-alpha1), [1  -alpha1],1024,44100) 
title('frequency response of the filter(alpha=0.9)')
figure(4)
alpha2=0.99;
freqz((1-alpha2), [1  -alpha2],1024,44100)
title('frequency response of the filter(alpha=0.99)')
noisefilter= myPeak(x,3000,4, 12, 44100);
figure(5)
subplot(2,1,1)
pwelch(noisefilter)
title('frequency response of mypeak (noise)')
cathy_2filter= myPeak(cathy_2,3000,4, 12, 44100);
subplot(2,1,2)
pwelch(cathy_2filter)
title('frequency response of mypeak(cathy_2)')

noise_filter2=my2ndorder(x,3000, 4, 12, 44100);
figure(6)
subplot(2,1,1)
pwelch(noise_filter2)
title('frequency response of my2ndorder (noise)')
cathy_2filter2=my2ndorder(cathy_2,3000,4, 12, 44100);
subplot(2,1,2)
pwelch(cathy_2filter2)
title('frequency response of my2ndorder(cathy_2)')
diff1=noise_filter2-noisefilter;
diff2=cathy_2filter2-cathy_2filter;
figure(7)
subplot(2,1,1)
plot(diff1)
title('diff for the my2ndorder and mypeak for noise');
xlabel('number of samples')
ylabel('magnitude')
subplot(2,1,2)
plot(diff2)
title('diff for the my2ndorder and mypeak for cathy_2')
xlabel('number of samples')
ylabel('magnitude')


