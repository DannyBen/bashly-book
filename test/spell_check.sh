#!/usr/bin/env bash
source "test/test_helper.bash"

# Check splling errors
header "Test: Spellcheck"
for f in $(find src -name '*.md') ; do
  output=$(aspell list --lang=en --personal aspell-custom-dict.txt --home-dir test < "$f" 2>&1)
  printf "\033[2K\r$f"
  if [[ $output ]]; then
    echo " - FAILED"
    failed=1
    echo "$output"
  fi
done

if [[ $failed ]]; then
  echo
  error "FAIL: Spellcheck"
  echo "     You have some typos."
  echo "     If they are valid, add them to test/aspell-custom-dict.txt"
  exit 1
else
  printf "\033[2K\rDone, no issues\n"
fi
