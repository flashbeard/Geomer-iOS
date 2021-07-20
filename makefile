vers:
	agvtool vers
newvers:
	agvtool new-version -all "$v"
	agvtool vers
release:
	agvtool new-version -all "$v"
	git add .
	git commit -m "v$v: $t" -m "$b"
	git push origin developer -f
	cloc .