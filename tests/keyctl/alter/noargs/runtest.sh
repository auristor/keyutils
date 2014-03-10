#!/bin/bash

. ../../../prepare.inc.sh
. ../../../toolbox.inc.sh


# ---- do the actual testing ----

result=PASS
echo "++++ BEGINNING TEST" >$OUTPUTFILE

# check that no arguments fails correctly
marker "ADD NO ARGS"
expect_args_error keyctl alter

# check that one argument fails correctly
marker "ADD ONE ARG"
expect_args_error keyctl alter @s

# check that two arguments fail correctly
marker "ADD TWO ARGS"
expect_args_error keyctl alter @s keyring

# check that five arguments fail correctly
marker "ADD FIVE ARGS"
expect_args_error keyctl alter @s keyring do-something some-data foo

echo "++++ FINISHED TEST: $result" >>$OUTPUTFILE

# --- then report the results in the database ---
toolbox_report_result $TEST $result
