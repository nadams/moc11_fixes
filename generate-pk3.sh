#!/bin/sh

FILES=$(ls | grep -vE '.pk3|.sh')

if [ -f moc11_fixes.pk3 ]; then
	rm -rf moc11_fixes.pk3
fi

zip -r9 moc11_fixes.pk3 $FILES -x *.backup* *.dbs *.bak *.db

