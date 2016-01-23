#!/bin/sh

if [ -z $1 ]; then
	echo "Remote branch name required."
	exit 1
fi

if [ -f moc11_fixes-diff-$CURRENT_REVISION.pk3 ]; then
	rm -f moc11_fixes-diff-$CURRENT_REVISION.pk3
fi

SOURCE_BRANCH=$(git rev-parse --abbrev-ref HEAD)
REMOTE_BRANCH=$1
CURRENT_REVISION=$(git log --pretty=format:'%h' -n 1)
FILES=$(git diff --name-only $SOURCE_BRANCH..$REMOTE_BRANCH)

zip -9r moc11_fixes-diff-$CURRENT_REVISION.pk3 $FILES -x *.backup* *.dbs *.bak *.db *.sh *.pk3 .gitignore
