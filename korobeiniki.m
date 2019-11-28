%% giris
% fundamental frequency: pitch
% pitch müzikte perde, perde ayarlamak anlamýnda
% decresing function: smoothing 
% strong to weak, weak to strong 

% piano key freqs: https://en.wikipedia.org/wiki/Piano_key_frequencies
%% implementasyon
% tum key numberlari freakanslarý ile tanýmlayabilirim

key_108_freq = 7902.133;


%% ornek 
fs = 10e3; % sampling rate 
t = 0 : 1/fs : 1.5; % sampled time array 
y = sin(2*pi*440*t); %% 440 Hz
%sound(y,fs); 
%sound(0.5*y,fs); %% modifications to amplitude
%sound(15*y,fs); %% clipping 

%t = 1 : 1/fs: 10;
%y = chirp(t,110,10,6*110)
%sound(y,fs); 

p = audioplayer(y,fs); % more flexible function



