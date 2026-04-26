#!/bin/bash

# Test script for GitHub Actions workflow
# This script simulates a test that would run in CI/CD

echo "========================================="
echo "Starting Shell Script Test"
echo "========================================="

# Test 1: Check if required tools are available
echo ""
echo "Test 1: Checking available tools..."
echo "  - bash: $(bash --version | head -n1)"
echo "  - git: $(git --version)"
echo "  - node: $(node --version 2>/dev/null || echo 'not installed')"

# Test 2: Verify we're in a git repository
echo ""
echo "Test 2: Verifying git repository..."
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "  ✓ Git repository detected"
    echo "  - Current branch: $(git branch --show-current)"
    echo "  - Latest commit: $(git log -1 --pretty=format:'%h - %s' HEAD)"
else
    echo "  ✗ Not a git repository"
    exit 1
fi

# Test 3: Simulate some tests
echo ""
echo "Test 3: Running simulated tests..."
TEST_PASSED=0
TEST_FAILED=0

# Simulate test 1
echo "  - Running test case 1..."
sleep 0.5
echo "    ✓ Test case 1 passed"
((TEST_PASSED++))

# Simulate test 2
echo "  - Running test case 2....."
sleep 0.5
echo "    ✓ Test case 2 passed"
((TEST_PASSED++))

# Simulate test 3
echo "  - Running test case 3..."
sleep 0.5
echo "    ✓ Test case 3 passed"
((TEST_PASSED++))

# Test 4: Environment variables check
echo ""
echo "Test 4: Environment check..."
echo "  - CI: ${CI:-not set}"
echo "  - GITHUB_ACTIONS: ${GITHUB_ACTIONS:-not set}"
echo "  - GITHUB_RUN_NUMBER: ${GITHUB_RUN_NUMBER:-not set}"

# Summary
echo ""
echo "========================================="
echo "Test Summary"
echo "========================================="
echo "  Passed: $TEST_PASSED"
echo "  Failed: $TEST_FAILED"
echo "  Total:  $((TEST_PASSED + TEST_FAILED))"
echo "========================================="

if [ $TEST_FAILED -eq 0 ]; then
    echo "✓ All tests passed!"
    exit 0
else
    echo "✗ Some tests failed!"
    exit 1
fi