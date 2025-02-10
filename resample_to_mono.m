[data,fs] = audioread('anechoic_recording.wav');
data = audioresample(data,InputRate=fs,OutputRate=44100);
%average left and right to convert to mono
if(min(size(data))) > 1
    data = (data(:,1) + data(:,2))/2;
end

audiowrite('anechoic_recording_44100.wav',data,44100);