clc
clear
stacksize('max')

[data]=edfread_samples('<Place adress to .edf file here>',3); // gets signal
samplefr=edf_get_samplefrequency('<Place adress to .edf file here>',3); // gets sample frequency


// Computation of the signal borders
// The beginning time: 22:06:03
// S0 - 22:11:33 do 22:12:03

S0a=5.5*60*samplefr;
S0b=S0a+60*samplefr;

// S1 - 22:15:03 do 22:15:33

S1a=9*60*samplefr;
S1b=S1a+30*samplefr;

// S2 - 22:27:03 dp 22:27:20

S2a=21*60*samplefr;
S2b=S2a+17*samplefr;

// S3 - 22:22:33 do 22:23:03

S3a=16.5*60*samplefr;
S3b=S3a+30*samplefr; 

// S4 - 22:30:03 do 22:30:33

S4a=24*60*samplefr;
S4b=S4a+30*samplefr;

// REM - 23:37:03 do 23:44:03

REMa=91*60*samplefr;
REMb=REMa+60*samplefr; 

figure()
title("Signals comparison")
subplot(611)
plot(data(S0a:1:S0b),'r');

subplot(612)
plot(data(S1a:1:S1b),'g');

subplot(613)
plot(data(S2a:1:S2b),'b');

subplot(614)
plot(data(S3a:1:S3b),'c');

subplot(615)
plot(data(S4a:1:S4b),'m');

subplot(616)
plot(data(REMa:1:REMb),'y');

// Phase R0

d_s = 40;

S0=(data(S0a:1:S0b))+50;
S0=(S0/100)*255;
S0=floor(S0);
sr0=size(S0);
sr0=sr0(1);
R0.time = (1:1:sr0)';
R0.values = S0(:,1);

for i = 1:1:floor(sr0/d_s)
    R0_s.values(i) = mean(R0.values(1+(i-1)*d_s:1:i*d_s));
end

R0_s.values = floor(R0_s.values);
R0_s.time = (1:1:floor(sr0/d_s))';

// Phase R1

S1=(data(S1a:1:S1b))+50;
S1=(S1/100)*255;
S1=floor(S1);
sr1=size(S1);
sr1=sr1(1);
R1.time = (1:1:sr1)';
R1.values = S1(:,1);

for i = 1:1:floor(sr1/d_s)
    R1_s.values(i) = mean(R1.values(1+(i-1)*d_s:1:i*d_s));
end

R1_s.values = floor(R1_s.values);
R1_s.time = (1:1:floor(sr1/d_s))';

// R2

S2=(data(S2a:1:S2b))+50;
S2=(S2/100)*255;
S2=floor(S2);
sr2=size(S2);
sr2=sr2(1);
R2.time = (1:1:sr2)';
R2.values = S2(:,1);

for i = 1:1:floor(sr2/(d_s/2))
    R2_s.values(i) = mean(R2.values(1+(i-1)*20:1:i*20));
end

R2_s.values = floor(R2_s.values);
R2_s.time = (1:1:floor(sr2/20))';

// R3

S3=(data(S3a:1:S3b))+50;
S3=(S3/100)*255;
S3=floor(S3);
sr3=size(S3);
sr3=sr3(1);
R3.time = (1:1:sr3)';
R3.values = S3(:,1);

for i = 1:1:floor(sr3/d_s)
    R3_s.values(i) = mean(R3.values(1+(i-1)*d_s:1:i*d_s));
end

R3_s.values = floor(R3_s.values);
R3_s.time = (1:1:floor(sr3/d_s))';

// R4

S4=(data(S4a:1:S4b))+50;
S4=(S4/100)*255;
S4=floor(S4);
sr4=size(S4);
sr4=sr4(1);
R4.time = (1:1:sr4)';
R4.values = S4(:,1);

for i = 1:1:floor(sr4/d_s)
    R4_s.values(i) = mean(R4.values(1+(i-1)*d_s:1:i*d_s));
end

R4_s.values = floor(R4_s.values);
R4_s.time = (1:1:floor(sr4/d_s))';

// REM

REM=(data(REMa:1:REMb))+50;
REM=(REM/100)*255;
REM=floor(REM);
REMsr=size(REM);
REMsr=REMsr(1);
REMR.time = (1:1:REMsr)';
REMR.values = REM(:,1);

for i = 1:1:floor(REMsr/d_s)
    REMR_s.values(i) = mean(REMR.values(1+(i-1)*d_s:1:i*d_s));
end

REMR_s.values = floor(REMR_s.values);
REMR_s.time = (1:1:floor(REMsr/d_s))';

figure()
title("Signals after mean filtering")
subplot(611)
plot(S0,'r');
//fprintfMat('C:\Users\Szymek\Desktop\S0.txt', data(S0a:1:S0b));

subplot(612)
plot(S1,'g');
//fprintfMat('C:\Users\Szymek\Desktop\S1.txt', data(S1a:1:S1b));

subplot(613)
plot(S2,'b');
//fprintfMat('C:\Users\Szymek\Desktop\S2.txt', data(S2a:1:S2b));

subplot(614)
plot(S3,'c');
//fprintfMat('C:\Users\Szymek\Desktop\S3.txt', data(S3a:1:S3b));

subplot(615)
plot(S4,'m');
//fprintfMat('C:\Users\Szymek\Desktop\S4.txt', data(S4a:1:S4b));

subplot(616)
plot(REM,'y');
//fprintfMat('C:\Users\Szymek\Desktop\REM.txt', data(REMa:1:REMb));

figure()
title("Signals after amplitude ???")
subplot(611)
plot(R0_s.values,'r');

subplot(612)
plot(R1_s.values,'g');

subplot(613)
plot(R2_s.values,'b');

subplot(614)
plot(R3_s.values,'c');

subplot(615)
plot(R4_s.values,'m');

subplot(616)
plot(REMR_s.values,'y');
