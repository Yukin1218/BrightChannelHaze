function matted_t = matting_t(I, t)

width = size(t, 2);
height = size(t, 1);
consts_map = ones(height, width);
%consts_vals = double(consts_map).*t;
I_norm = double(I) / 255;
%I_norm = rgb2gray(I_norm);
matted_t = solveAlpha(I_norm, consts_map, t);
% thr_alpha=[];
% epsilon=[];
% win_size=[];
% levels_num=2;
% active_levels_num=1;
% matted_t = solveAlphaC2F(I_norm, consts_map, t, levels_num, ...
%                     active_levels_num, thr_alpha, epsilon, win_size);

end
