function [A, locations, best_index] = get_atmosphere(rgb, Dark)

w = size(rgb, 2);
h = size(rgb, 1);
N = ceil(w*h*0.01);
gray = rgb2gray(rgb);
[Brightest, locations] = sort(Dark(:), 'descend');
bright_locations = locations(1:N);
[best_cands, bls] = sort(gray(bright_locations), 'descend');
best_index = bls(1);
best_index = locations(best_index);
R = rgb(:, :, 1);
G = rgb(:, :, 2);
B = rgb(:, :, 3);
A = [R(best_index), G(best_index), B(best_index)];

end
