set branch (git rev-parse --abbrev-ref HEAD)
git fetch \
&& git log --color -p --full-diff $branch..origin/$branch \
&& git merge origin/$branch
