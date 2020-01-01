%% giris
% fundamental frequency: pitch
% pitch m�zikte perde, perde ayarlamak anlam�nda
% decresing function: smoothing 
% strong to weak, weak to strong 

% piano key freqs: https://en.wikipedia.org/wiki/Piano_key_frequencies
%% implementasyon
% tum key numberlari freakanslar� ile tan�mlayabilirim

%key_108_freq = 7902.133;


%% ornek  
%fs = 10e3; % sampling rate 
%t = 0 : 1/fs : 1.5; % sampled time array 
%y = sin(2*pi*440*t); %% 440 Hz
%sound(y,fs); 
%sound(0.5*y,fs); %% modifications to amplitude
%sound(15*y,fs); %% clipping 

%t = 1 : 1/fs: 10;
%y = chirp(t,110,10,6*110)
%sound(y,fs); 

%p = audioplayer(y,fs); % more flexible function

%fs = 10e3; % sampling rate 
%t = 0 : 1/fs : 1.5; % sampled time array 
%y = sin(2*pi*440*t); %% 440 Hz
%sound(y,fs); 
%sound(0.5*y,fs); %% modifications to amplitude
%sound(15*y,fs); %% clipping 

%t = 1 : 1/fs: 10;
%y = chirp(t,110,10,6*110)
%sound(y,fs); 
%p = audioplayer(y,fs); % more flexible function 

%% kendi yapt�g�m notalar� manul olarak girebilirim 
% daha gorununur bir alanda sampling al 
%{
fs = 1000;
t = 0 : 1/fs : 2;

freq_1 = 440.00 ;
freq_2 = 415.30 ;
freq_3 = 391.9954;freq_4 = 369.9944 ;freq_5 = 349.2282 ;freq_6 = 329.6276;freq_7 = 311.1270 ;freq_8 = 293.6648;freq_9 = 277.1826;
freq_10 = 261.6256;

freq_11 = 466.16;
freq_12 = 493.88;

y = sin(2*pi*freq_1*t);

figure(1);
plot(y);
sound(y,fs);

c = fft(y);
figure(2);
plot(abs(c));
sound(rand(100000,1),20000) % linkinpark
%}
%% son

notecreate = @(frq,dur) sin(2*pi* [1:dur]/8192 * (440*2.^((frq-1)/12)));

notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#' ' '};
song = {'A' 'A' 'E' 'E' 'F#' 'F#' 'E' 'E' 'D' 'D' 'C#' 'C#' 'B' 'B' 'A' 'A'};
%song = { 'G' 'G' ' ' 'A' 'B' 'A' 'G' 'B' 'A' 'A' 'G' 'G' 'G' 'G' 'G' 'A' 'B' ' ' 'A' 'G' 'B' 'A' ' '  'A' 'G'};
%song = { 'G' 'A' 'G' 'E' 'G' 'A' 'G' 'E' 'D' 'D' 'B' 'B' 'C#' 'C' 'G'  'A' 'A' 'C' 'B' 'A' 'G' 'A' 'G' 'E' 'A' 'A' 'C' 'B' 'A' 'G' 'A' 'G' 'E' 'A' 'A' 'C' 'B' 'A' 'G' 'A' 'G' 'E' 'D' 'D' 'F' 'D' 'F' 'D' 'B' 'C' 'E' 'C' 'G' 'E' 'G' 'F' 'D' 'C' };


for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);
end    

dur = 1.5*0.3*8192;
songnote = [];
for k1 = 1:length(songidx)
    if songidx(k1) == 13
        % fprintf("deneme\n")
        songnote = [songnote; [sin(2*pi* [1:dur]/8192 * (0))  zeros(1,75)]'];
        continue
    end
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];

end

soundsc(songnote, 8192);
clear
 
%% kaynaklar 
% https://en.wikipedia.org/wiki/Scientific_pitch_notation
% https://www.mathworks.com/matlabcentral/answers/48717-create-a-piece-of-music-using-matlab
% https://pianoletternotes.blogspot.com/2017/10/tetris-theme-by-korobeiniki.html
% https://www.quora.com/Which-melodies-can-you-play-on-a-diatonic-one-octave-toy-piano
