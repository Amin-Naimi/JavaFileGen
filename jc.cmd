@echo off
if "%~1"=="" goto usage
if "%~2"=="" goto usage

set "file_name=%~1"
set "file_type=%~2"

if "%file_type%"=="-i" (
    echo public interface %file_name% { > %file_name%.java  
    echo. >> %file_name%.java
    echo } >> %file_name%.java
) else if "%file_type%"=="-c" (
    echo public class %file_name% { > %file_name%.java
    echo. >> %file_name%.java
    echo } >> %file_name%.java
) else (
    echo Unknown type: %file_type%
    exit /b 1
)

echo %file_name%.java has been successfully created.
exit /b 0

:usage
echo Usage: %~nx0 <name> <-i | -c>
exit /b 1