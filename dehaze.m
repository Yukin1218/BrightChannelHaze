function J = dehaze(I, w, t_0)

figure;
imshow(I);
title('Hazed Image');
width = size(I, 2);
height = size(I, 1);
Dark = calc_dark_channel(I, 7);
% figure;
% imshow(uint8(Dark));
% title('Dark channel');
[A, A_locations, A_index] = get_atmosphere(I, Dark);
t_init = estimate_t(I, A, w);
% figure;
% imshow(t_init);
% title('show initial t');
t = matting_t(I, t_init);
% figure;
% imshow(t);
% title('show matted t');
A_extend = zeros(height, width, 3);
A_extend(:, :, 1) = double(A(1))*(ones(height, width));
A_extend(:, :, 2) = double(A(2))*(ones(height, width));
A_extend(:, :, 3) = double(A(3))*(ones(height, width));
t_extend = zeros(height, width, 3);
t_extend(:, :, 1) = max(t, t_0);
t_extend(:, :, 2) = max(t, t_0);
t_extend(:, :, 3) = max(t, t_0);
I_double = double(I);
J = uint8((I_double - A_extend) ./ t_extend + A_extend);
figure;
imshow(J);
title('Dehazed Image');

end
