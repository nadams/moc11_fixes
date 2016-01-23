#!/bin/sh

FILES=$(ls | grep -vE '.pk3|.sh')
CURRENT_REVISION=$(git log --pretty=format:'%h' -n 1)

if [ -f moc11_fixes-$CURRENT_REVISION.pk3 ]; then
	rm -rf moc11_fixes-$CURRENT_REVISION.pk3
fi

zip -9r moc11_fixes-$CURRENT_REVISION.pk3 $FILES -x *.backup* *.dbs *.bak *.db
