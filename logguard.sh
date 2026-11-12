#!/bin/bash

# ==========================================
#          LOGGUARD
#   Unix System Log Analyzer & Alert System
# ==========================================

# Check if system.log exists
if [ ! -f system.log ]; then
    echo "Error: system.log file not found!"
    echo "Please create the log file first."
    exit 1
fi

# Check if system.log is empty
if [ ! -s system.log ]; then
    echo "Error: system.log is empty!"
    exit 1
fi

# ==========================================
#              MAIN MENU
# ==========================================

echo "|============================================|"
echo "|--------------------------------------------|"
echo "|                |LOGGUARD|                  |"
echo "|--------------------------------------------|"
echo "|  Unix System Log Analyzer and Alert System |"
echo "|--------------------------------------------|"
echo "|============================================|"
echo "|============================================|"
echo "|            | 1. View Log                   |"
echo "|            | 2. Count Errors               |"
echo "|            | 3. Find Failed Logins         |"
echo "|            | 4. Generate Report            |"
echo "|            | 5. Exit                       |"
echo "|============================================|"
echo "|============================================|"

read -p "Enter your choice: " choice

# ==========================================
#              MENU OPTIONS
# ==========================================

case $choice in

    1)
        echo ""
        echo "========== SYSTEM LOG =========="
        cat system.log
        ;;

    2)
        echo ""
        echo "========== ERROR COUNT =========="

        error_count=$(grep -c "ERROR" system.log)

        if [ "$error_count" -gt 0 ]; then
            echo "Total Errors: $error_count"
        else
            echo "No errors found."
        fi
        ;;

    3)
        echo ""
        echo "====== FAILED LOGIN ATTEMPTS ======"

        failed_count=0

        while IFS= read -r line
        do
            if [[ "$line" == *"FAILED"* ]]; then
                failed_count=$((failed_count + 1))
            fi
        done < system.log

        if [ "$failed_count" -gt 0 ]; then
            echo "Failed Login Attempts: $failed_count"
            echo ""
            echo "Details:"
            grep "FAILED" system.log
        else
            echo "No failed login attempts found."
        fi
        ;;

    4)
        echo ""
        echo "======= GENERATING REPORT ======="

        error_count=$(grep -c "ERROR" system.log)

        failed_count=0

        while IFS= read -r line
        do
            if [[ "$line" == *"FAILED"* ]]; then
                failed_count=$((failed_count + 1))
            fi
        done < system.log

        # Array for log types
        log_types=("INFO" "ERROR" "FAILED" "WARNING")

        echo "Log Type Summary:"

        # For loop to count log types
        for type in "${log_types[@]}"
        do
            count=$(grep -c "$type" system.log)
            echo "$type: $count"
        done

        echo ""

        # Create report file
        echo "==========================================" > report.txt
        echo "             LOGGUARD REPORT" >> report.txt
        echo "==========================================" >> report.txt
        echo "" >> report.txt

        echo "Total Errors: $error_count" >> report.txt
        echo "Failed Login Attempts: $failed_count" >> report.txt
        echo "" >> report.txt

        # Check failed login status
        if [ "$failed_count" -gt 0 ]; then
            echo "WARNING: Failed login attempts detected." >> report.txt
        else
            echo "No failed login attempts detected." >> report.txt
        fi

        echo "" >> report.txt
        echo "Log Type Summary:" >> report.txt

        # For loop for report
        for type in "${log_types[@]}"
        do
            count=$(grep -c "$type" system.log)
            echo "$type: $count" >> report.txt
        done

        echo "" >> report.txt
        echo "Failed Login Details:" >> report.txt

        grep "FAILED" system.log >> report.txt

        echo "" >> report.txt
        echo "Report generated successfully." >> report.txt

        echo ""
        echo "Report generated successfully!"
        echo "Saved as: report.txt"
        ;;

    5)
        echo ""
        echo "Exiting LogGuard..."
        exit 0
        ;;

    *)
        echo ""
        echo "Error: Invalid choice!"
        echo "Please enter a number between 1 and 5."
        ;;

esac
