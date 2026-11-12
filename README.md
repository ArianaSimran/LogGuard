# LogGuard

## Unix System Log Analyzer & Alert System

LogGuard is a simple Bash-based Unix system log analyzer. It reads a system log file, analyzes different types of log messages, detects failed login attempts, counts errors, and generates a report.

## Features

- View system logs
- Count system errors
- Detect failed login attempts
- Display log type statistics
- Generate an automatic report
- Handle missing log files
- Handle empty log files
- Handle invalid menu choices
- Use conditional statements and loops
- Terminal-based user interface

## Technologies Used

- Bash Shell Scripting
- Unix/Linux Terminal
- `grep`
- `cat`
- File handling
- Conditional statements
- `case`
- `for` loop
- `while` loop

## Project Structure

```text
LogGuard/
├── logguard.sh
├── system.log
├── report.txt
└── README.md

Menu Options
1. View Log
Displays all records stored in system.log.
2. Count Errors
Counts the number of ERROR entries in the system log.
3. Find Failed Logins
Searches the log file for failed login attempts and displays their details.
4. Generate Report
Analyzes the log file and creates a report.txt file containing:
- Total errors
- Failed login attempts
- Log type summary
- Failed login details
5. Exit
Closes the LogGuard program.
Error Handling
LogGuard checks whether:
- system.log exists
- system.log is empty
- The user enters a valid menu option
If an error is detected, an appropriate message is displayed and the program handles the situation safely.
Sample Log Types
The system can analyze:
- INFO
- ERROR
- FAILED
- WARNING
Sample Output
==============================================
|                                            |
|                  LOGGUARD                  |
|                                            |
|   Unix System Log Analyzer and Alert System|
|                                            |
==============================================
|                                            |
|              1. View Log                  |
|              2. Count Errors              |
|              3. Find Failed Logins        |
|              4. Generate Report           |
|              5. Exit                      |
|                                            |
==============================================

Enter your choice:

Purpose
The main purpose of LogGuard is to provide a simple command-line tool for analyzing system logs and identifying important events such as errors and failed login attempts.
Conclusion
LogGuard demonstrates the practical use of Bash scripting and Unix commands for system log analysis. The project uses conditions, loops, file handling, pattern searching, and error handling to process log data and generate useful information.
