function [] = cropAudio(input, start, finish)
%
if start > finish
    error('Start time cannot be greater than end time')
end

info = audioinfo(input);

if start == 0
    start = 1/info.SampleRate;
end

if finish > info.Duration
    error('End time cannot be greater than %d',info.Duration);
end

samples = [start * info.SampleRate finish*info.SampleRate];
[x,fs] = audioread(input,samples);
filename = strcat('cropped_',input);
audiowrite(filename,x,fs);

end