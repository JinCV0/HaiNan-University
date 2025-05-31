@echo off
setlocal enabledelayedexpansion

echo Cleaning LaTeX temporary files...

:: List of file extensions to delete
set extensions=.aux .log .out .thm .toc .bbl .blg .fdb_latexmk .fls .gz

:: Loop through each extension and delete matching files
for %%e in (%extensions%) do (
    echo Deleting files with extension %%e ...
    for /r %%f in (*%%e) do (
        if exist "%%f" (
            echo Deleting: %%f
            del /f /q "%%f"
        )
    )
)

echo Cleanup complete.
pause
