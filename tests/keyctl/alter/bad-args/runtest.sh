#!/bin/bash

. ../../../prepare.inc.sh
. ../../../toolbox.inc.sh


# ---- do the actual testing ----

result=PASS
echo "++++ BEGINNING TEST" >$OUTPUTFILE

# check that an empty key id fails correctly
marker "CHECK EMPTY KEY ID"
alter_key --fail "" some-type do-something
expect_error EINVAL

# check that an invalid key id fails correctly
marker "CHECK INVALID KEY ID"
alter_key --fail 0 some-type do-something
expect_error EINVAL

# check that an empty key type fails correctly
marker "CHECK EMPTY KEY TYPE"
alter_key --fail @s "" do-something
expect_error EINVAL

# check that an empty command fails correctly
marker "CHECK EMPTY COMMAND"
alter_key --fail @s some-type ""
expect_error EINVAL

# check that an empty data argument fails correctly
marker "CHECK EMPTY DATA"
alter_key --fail @s some-type do-something ""
expect_error EINVAL

echo "++++ FINISHED TEST: $result" >>$OUTPUTFILE

# --- then report the results in the database ---
toolbox_report_result $TEST $result
