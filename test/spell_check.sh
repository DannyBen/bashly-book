#!/usr/bin/env bash
source "test/test_helper.bash"

header "Test: Spell check"
if ! (typos); then
  error "FAIL: Broken Links"
  exit 1
fi
