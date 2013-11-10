function Dark = calc_dark_channel(rgb_ori, patch_width)

rgb = double(rgb_ori);
pw = patch_width;
w = size(rgb, 2);
h = size(rgb, 1);
Dark = double(ones(h, w));
min_value = 1000;
for row = 1:1:h
	%row
	for col = 1:1:w
		rs = row - pw;
		if rs < 1
			rs = 1;
		else
		end
		re = row + pw;
		if re > h
			re = h;
		else
		end
		cs = col - pw;
		if cs < 1
			cs = 1;
		else
		end
		ce = col + pw;
		if ce > w
			ce = w;
		else
        end
		min_value = 1000;
		for in_r = rs:1:re
			for in_c = cs:1:ce
				for ch = 1:1:3
					if rgb(in_r, in_c, ch) < min_value
						Dark(row, col) = rgb(in_r, in_c, ch);
						min_value = rgb(in_r, in_c, ch);
					else
					end
				end
			end
		end
	end
end

end
