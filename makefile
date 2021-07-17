vers:
	agvtool new-version -all "$v"
	agvtool vers
git:
	git add .
	git commit -m "$t" -m "$b"
	git push -f
release:
	agvtool new-version -all "$v"
	git add .
	git commit -m "v$v"
	git push -f
	cloc .