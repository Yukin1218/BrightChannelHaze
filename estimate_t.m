function t = estimate_t(rgb, A, w)

% t(x) = 1 - w min_c(min_{y \in \Sigma(x)} I^c(y)/A^c)
width = size(rgb, 2);
height = size(rgb, 1);
t = 0;
A_extend = rgb;
A_extend(:, :, 1) = A(1)*uint8(ones(height, width));
A_extend(:, :, 2) = A(2)*uint8(ones(height, width));
A_extend(:, :, 3) = A(3)*uint8(ones(height, width));
devide = double(rgb) ./ double(A_extend);
part = calc_dark_channel(devide, 7);
t = double(ones(height, width)) - w * double(part);

end
