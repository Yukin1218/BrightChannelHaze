rap=255.0;

i=1;
disp('Hit a key to see next scene');

while (i<18)
	% original scene without fog
	withoutfogfn=sprintf('LIma-%.6d.png',i);
	withoutfog=double(imread(withoutfogfn))/rap;	% now between O and 1
	% depthmap as a float point array
	depthmapfn=sprintf('Dmap-%.6d.fdd',i);
	depthmap=double(load(depthmapfn))/1000.0; 	% now in meters	
	d=1.0-depthmap./(100+depthmap);
	% with uniform fog 
	u080fn=sprintf('U080-%.6d.png',i);
	u080=double(imread(u080fn))/rap; 		% now between O and 1
	% with heterogeneous fog 
	k080fn=sprintf('K080-%.6d.png',i);
	k080=double(imread(k080fn))/rap; 		% now between O and 1
	% with cloudy fog  
	l080fn=sprintf('L080-%.6d.png',i);
	l080=double(imread(l080fn))/rap; 		% now between O and 1
	% with cloudy heterogeneous fog  
	m080fn=sprintf('M080-%.6d.png',i);
	m080=double(imread(m080fn))/rap; 		% now between O and 1
	% display
	subplot(2,3,1); subimage(withoutfog);
	set(gca,'xtick',[],'ytick',[]);title('without fog');
	subplot(2,3,2); subimage(d);
	set(gca,'xtick',[],'ytick',[]);title('depthmap');
	subplot(2,3,3); subimage(u080);
	set(gca,'xtick',[],'ytick',[]);title('with homogeneous fog');
	subplot(2,3,4); subimage(k080);
	set(gca,'xtick',[],'ytick',[]);title('with heterogeneous fog');
	subplot(2,3,5); subimage(l080);
	set(gca,'xtick',[],'ytick',[]);title('with cloudy fog');
	subplot(2,3,6); subimage(m080);
	set(gca,'xtick',[],'ytick',[]);title('with cloudy heterogeneous fog');
	w=waitforbuttonpress;
	if w==1 i=i+1;
	end
end

