#!bash
#
# This is a test suite for testing replaceProperties.pl
#


# Helper functions for testing
function info() {
	echo -e "\033[0;32m$1"
	echo -n -e "\033[0m"
}

function fail() {
	echo -e "\033[1;31m$1"
	echo -n -e "\033[0m"
	exit 1
}


# Test cases

###############################################################
# Case 0: templateFile does not exist: bail out
info "Testing case 0..."
perl ../replaceProperties.pl nonExistingTpl nonExistingDest
RET=$?

if [ "$RET" == "0" ]
then
	fail "Non existing template file should render error return"
fi



###############################################################
# Case 1: destination does not exist yet: just copy to destination
info "Testing case 1..."
cat << EOF > testcase1.tpl
foo=bar
bla=boe
toBeDetermined=??
EOF
TPL=testcase1.tpl
DST=testcase1.dest

rm -f $DST
perl ../replaceProperties.pl $TPL $DST
if [ ! -f $DST ]
then
	fail "$DST should exist"
fi
if ! diff $TPL $DST # returns true/0 if no difference
then
  fail "When destination file does not exist, the result should be that template and destination file do not differ."
fi



###############################################################
# Case 2: No changes in _keys_ (but probably in values): do not do anything
info "Testing case 2..."

cat  << EOF > testcase2.tpl
# A comment
foo=bar
bla=boe
toBeDetermined=??
#
EOF
TPL=testcase2.tpl
cat  << EOF > testcase2.dest
foo=bar2
bla=boe2
toBeDetermined=filledIn
EOF
TPL=testcase2.tpl

DST=testcase2.dest

HASH_BEFORE=`md5sum $DST`
perl ../replaceProperties.pl $TPL $DST
HASH_AFTER=`md5sum $DST`
if [[ "$HASH_BEFORE" != "$HASH_AFTER" ]]
then
  fail "Destination file $DST has been touched, while it should not be touched"
fi


###############################################################
# Case 3:
#  - template has placeholder values ('??') that already have real values in the destination file
#  - template that has overwritten specific values, should keep those values
#  - template that has old values (not in template anymore) should remove those
info "Testing case 3..."
cat  << EOF1 > testcase3.tpl
#
# Copyright 2013 SURFnet bv, The Netherlands
#
# Licensed under the Apache License, Version 2.0 (the "License");
# Yada...

prop1=val1
prop2=??
prop3=val3 # with comment
prop4=val4fromTemplate
prop6=??
# comment on new line

EOF1

cat  << EOF2 > testcase3.dest
prop1=val1
prop2=val2
prop4=val4overwritten
prop5=oldValue
EOF2

perl ../replaceProperties.pl testcase3.tpl testcase3.dest

if ! grep -q "prop6=??" testcase3.dest
then
  fail "Dest file should contain placeholder for property that has no equivalent in destination file yet."
fi
if ! grep -q prop2=val2 testcase3.dest
then
  fail "Dest file should contain already existing property"
fi
if ! grep -q prop3=val3 testcase3.dest
then
  fail "Dest file should contain new property from template"
fi
if ! grep -q "# with comment" testcase3.dest
then
  fail "Dest file should contain comment from template"
fi

if grep -q "prop4=val4fromTemplate" testcase3.dest
then
  fail "Property that has been customized in dest file should be retained"
fi

if grep -q "prop5" testcase3.dest
then
  fail "Obsolete properties should not be included anymore"
fi

rm -f *.dest *.tpl

echo
info "All test cases succeeded"
echo