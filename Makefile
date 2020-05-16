
publish:
	@hexo g && hexo d

push:
	@git add . && git commit -m 'auto:changes committed' && git push origin startup