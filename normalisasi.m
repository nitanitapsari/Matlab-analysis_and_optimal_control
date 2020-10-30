function [y1_new, y2_new]=normalisasi(y1,y2);
    y=[y1;y2]
    y1_new=(y1-min(y))/(max(y)-min(y))
    y2_new=(y2-min(y))/(max(y)-min(y))
end



