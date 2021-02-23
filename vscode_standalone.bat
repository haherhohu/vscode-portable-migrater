@setlocal enableextensions enabledelayedexpansion
@echo off

rem ################################################################
rem installed vscode extensions to migrate portable mode for windows
rem 
rem Author: Daegung Kim
rem Date: 2021-02-23
rem ################################################################

rem ==========
rem initialize
rem ==========

rem parse arguments
rem ===============

set targetdir=%~dp0
if not [%1] == [] set targetdir=%1

set datadir=!targetdir!data
set userdatadir=!datadir!\user-data
set extensionsdir=!datadir!\extensions

rem check targets
echo targetdir = !targetdir!
echo datadir = !datadir!
echo userdatadir = !userdatadir!
echo extensionsdir = !extensionsdir!

rem make-dir
mkdir !userdatadir!
mkdir !extensionsdir!

rem copy all
xcopy %APPDATA%\Code\ !userdatadir! /S /Y
xcopy %USERPROFILE%\.vscode\extensions !extensionsdir! /S /Y

echo !targetdir! > !datadir!\vscode_version.txt
echo end of process
