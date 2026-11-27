#!/bin/bash

# Define the expected result
EXPECTED=200

# Execute the API request and capture its status
ACTUAL=$(curl -sS -o /dev/null -w "%{http_code}" \
  "$BASE_URL/room/1")

# Compare actual with expected
if [ "$ACTUAL" = "$EXPECTED" ]; then
    echo "TC-002: PASS"
    echo "Expected: $EXPECTED"
    echo "Actual: $ACTUAL"
else
    echo "TC-002: FAIL"
    echo "Expected: $EXPECTED"
    echo "Actual: $ACTUAL"
fi

