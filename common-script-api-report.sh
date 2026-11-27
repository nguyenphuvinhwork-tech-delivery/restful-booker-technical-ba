
#!/bin/bash

# Universal REST API Test Runner
# Compatible with macOS Bash 3.2

set -u

BASE_URL="${BASE_URL:-}"
CASES="${CASES:-bash-tests/cases.txt}"
REPORT="${REPORT:-reports/api-results.csv}"
AUTH_TOKEN="${AUTH_TOKEN:-}"
MOCK_MODE="${MOCK_MODE:-0}"

if [ -z "$BASE_URL" ]; then
    echo "ERROR: Set BASE_URL first."
    exit 1
fi

if [ ! -f "$CASES" ]; then
    echo "ERROR: Test case file not found: $CASES"
    exit 1
fi

mkdir -p "$(dirname "$REPORT")"

printf "TestID,Method,Path,Expected,Actual,Time,JSONCheck,Result\n" > "$REPORT"

passed=0
failed=0

while IFS='|' read -r id method path expected payload field value || [ -n "${id:-}" ]; do

    # Ignore blank lines and comments
    case "$id" in
        ""|\#*) continue ;;
    esac

    response_file=$(mktemp)

    # Prepare the HTTP request
    args=(-sS --max-time 20 -X "$method"
          -o "$response_file"
          -w "%{http_code},%{time_total}"
          -H "Accept: application/json")

    # Optional authentication
    if [ -n "$AUTH_TOKEN" ]; then
        args+=(-H "Authorization: Bearer $AUTH_TOKEN")
    fi

    # Optional Postman mock response selection
    if [ "$MOCK_MODE" = "1" ]; then
        args+=(-H "x-mock-response-code: $expected")
    fi

    # Optional JSON request body
    if [ "$payload" != "-" ] && [ -n "$payload" ]; then
        if [ ! -f "$payload" ]; then
            echo "$id: FAIL - Body file missing"
            failed=$((failed + 1))
            rm -f "$response_file"
            continue
        fi

        args+=(-H "Content-Type: application/json"
               --data-binary "@$payload")
    fi

    # Execute request
    response=$(curl "${args[@]}" "${BASE_URL%/}$path")
    curl_exit=$?

    actual="${response%%,*}"
    duration="${response#*,}"

    result="PASS"
    json_check="SKIP"

    # Validate HTTP status
    if [ "$curl_exit" -ne 0 ] || [ "$actual" != "$expected" ]; then
        result="FAIL"
    fi

    # Optional JSON value validation
    if [ "$result" = "PASS" ] && [ "$field" != "-" ]; then

        if jq -e \
            --arg key "$field" \
            --arg expected "$value" \
            '(.[$key] | tostring) == $expected' \
            "$response_file" >/dev/null 2>&1; then

            json_check="PASS"
        else
            json_check="FAIL"
            result="FAIL"
        fi
    fi

    # Save results
    printf "%s,%s,%s,%s,%s,%s,%s,%s\n" \
        "$id" "$method" "$path" "$expected" \
        "$actual" "$duration" "$json_check" "$result" \
        >> "$REPORT"

    echo "$id: $result (HTTP $actual)"

    if [ "$result" = "PASS" ]; then
        passed=$((passed + 1))
    else
        failed=$((failed + 1))
    fi

    rm -f "$response_file"

done < "$CASES"

echo "--------------------------"
echo "Passed: $passed"
echo "Failed: $failed"
echo "Report: $REPORT"

[ "$failed" -eq 0 ]

