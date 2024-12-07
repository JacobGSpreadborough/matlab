function [modeFrequencies] = roomModeFrequency(c,L,W,H,order)
%calculates room modes and prints them to a LaTeX table


modes = zeros(3^order,3);
frequencies = zeros(3^order,1);
i = 1;

for n = 0:order
    for p = 0:order
        for q = 0:order
            frequencies(i) =  c/2 * sqrt((n/L)^2 + (p/W)^2 + (q/H)^2);
            modes(i,:) = [n,p,q];
            i = i + 1;
        end
    end
end


modeFrequencies = [frequencies,modes];
modeFrequencies = sortrows(modeFrequencies);

fid = fopen('table.txt','w');

%skip first row of 0s
for i = 2:max(size(modeFrequencies))
    fprintf(fid,'%0.2f & ',modeFrequencies(i,1));
    for c = 2:3
        fprintf(fid,'%d,',modeFrequencies(i,c));
    end
    fprintf(fid,'%d \\\\ \n \\hline \n',modeFrequencies(i,4));
    
end


end