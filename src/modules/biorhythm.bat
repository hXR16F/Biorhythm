:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
mode 80,25 & setlocal EnableDelayedExpansion

:main
	set counter=1
	for /f "tokens=1,2,3 delims=." %%i in (settings.ini) do (
		if !counter! equ 2 (
			set "year=%%i"
			set "mm=%%j"
			set "dd=%%k"
		)
		set /a counter+=1
	)
	if "%mm:~0,1%" equ "0" set "mm=%mm:~1,1%"
	if "%dd:~0,1%" equ "0" set "dd=%dd:~1,1%"
	call :convjdate
	set juldate=%jdate%
	
	for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
	set "year=%dt:~0,4%" & set "mm=%dt:~4,2%" & set "dd=%dt:~6,2%"
	if "%mm:~0,1%" equ "0" set "mm=%mm:~1,1%"
	
	call :convjdate
	set juldate1=%jdate%
	
	set /a daydiff=%juldate1%-%juldate%-1
	echo s(2*(4*a(1))*%daydiff%/23) | bc.exe -l > "physical.txt"
	for /f %%i in (physical.txt) do set "physical=%%i"
	set "physical=!physical:~0,4!
	if "!physical:~0,3!" equ "-1." (set "physical_yesterday=-100") else (if "!physical:~0,2!" equ "1." (set "physical_yesterday=100"))
	if "!physical:~0,1!" equ "." (if "!physical:~1,1!" equ "0" (set "physical_yesterday=!physical:~2,1!") else (set "physical_yesterday=!physical:~1,2!"))
	if "!physical:~1,1!" equ "." if "!physical:~0,1!" equ "-" (if "!physical:~2,2!" equ "00" (set "physical_yesterday=!physical:~2,2!") else (set "physical_yesterday=-!physical:~2,2!"))
	if "%physical_yesterday%" equ "00" set "physical_yesterday=0"
	if "%physical_yesterday:~0,2%" equ "-0" set "physical_yesterday=-%physical_yesterday:~2,1%"
	echo s(2*(4*a(1))*%daydiff%/28) | bc.exe -l > "emotional.txt"
	for /f %%i in (emotional.txt) do set "emotional=%%i"
	set "emotional=!emotional:~0,4!
	if "!emotional:~0,3!" equ "-1." (set "emotional_yesterday=-100") else (if "!emotional:~0,2!" equ "1." (set "emotional_yesterday=100"))
	if "!emotional:~0,1!" equ "." (if "!emotional:~1,1!" equ "0" (set "emotional_yesterday=!emotional:~2,1!") else (set "emotional_yesterday=!emotional:~1,2!"))
	if "!emotional:~1,1!" equ "." if "!emotional:~0,1!" equ "-" (if "!emotional:~2,2!" equ "00" (set "emotional_yesterday=!emotional:~2,2!") else (set "emotional_yesterday=-!emotional:~2,2!"))
	if "%emotional_yesterday%" equ "00" set "emotional_yesterday=0"
	if "%emotional_yesterday:~0,2%" equ "-0" set "emotional_yesterday=-%emotional_yesterday:~2,1%"
	echo s(2*(4*a(1))*%daydiff%/33) | bc.exe -l > "intellectual.txt"
	for /f %%i in (intellectual.txt) do set "intellectual=%%i"
	set "intellectual=!intellectual:~0,4!
	if "!intellectual:~0,3!" equ "-1." (set "intellectual_yesterday=-100") else (if "!intellectual:~0,2!" equ "1." (set "intellectual_yesterday=100"))
	if "!intellectual:~0,1!" equ "." (if "!intellectual:~1,1!" equ "0" (set "intellectual_yesterday=!intellectual:~2,1!") else (set "intellectual_yesterday=!intellectual:~1,2!"))
	if "!intellectual:~1,1!" equ "." if "!intellectual:~0,1!" equ "-" (if "!intellectual:~2,2!" equ "00" (set "intellectual_yesterday=!intellectual:~2,2!") else (set "intellectual_yesterday=-!intellectual:~2,2!"))
	if "%intellectual_yesterday%" equ "00" set "intellectual_yesterday=0"
	if "%intellectual_yesterday:~0,2%" equ "-0" set "intellectual_yesterday=-%intellectual_yesterday:~2,1%"
	for %%i in (physical	emotional	intellectual) do del /f /q "%%i.txt" >nul
	
	set /a daydiff+=1
	echo s(2*(4*a(1))*%daydiff%/23) | bc.exe -l > "physical.txt"
	for /f %%i in (physical.txt) do set "physical=%%i"
	set "physical=!physical:~0,4!
	if "!physical:~0,3!" equ "-1." (set "physical_today=-100") else (if "!physical:~0,2!" equ "1." (set "physical_today=100"))
	if "!physical:~0,1!" equ "." (if "!physical:~1,1!" equ "0" (set "physical_today=!physical:~2,1!") else (set "physical_today=!physical:~1,2!"))
	if "!physical:~1,1!" equ "." if "!physical:~0,1!" equ "-" (if "!physical:~2,2!" equ "00" (set "physical_today=!physical:~2,2!") else (set "physical_today=-!physical:~2,2!"))
	if "%physical_today%" equ "00" set "physical_today=0"
	if "%physical_today:~0,2%" equ "-0" set "physical_today=-%physical_today:~2,1%"
	echo s(2*(4*a(1))*%daydiff%/28) | bc.exe -l > "emotional.txt"
	for /f %%i in (emotional.txt) do set "emotional=%%i"
	set "emotional=!emotional:~0,4!
	if "!emotional:~0,3!" equ "-1." (set "emotional_today=-100") else (if "!emotional:~0,2!" equ "1." (set "emotional_today=100"))
	if "!emotional:~0,1!" equ "." (if "!emotional:~1,1!" equ "0" (set "emotional_today=!emotional:~2,1!") else (set "emotional_today=!emotional:~1,2!"))
	if "!emotional:~1,1!" equ "." if "!emotional:~0,1!" equ "-" (if "!emotional:~2,2!" equ "00" (set "emotional_today=!emotional:~2,2!") else (set "emotional_today=-!emotional:~2,2!"))
	if "%emotional_today%" equ "00" set "emotional_today=0"
	if "%emotional_today:~0,2%" equ "-0" set "emotional_today=-%emotional_today:~2,1%"
	echo s(2*(4*a(1))*%daydiff%/33) | bc.exe -l > "intellectual.txt"
	for /f %%i in (intellectual.txt) do set "intellectual=%%i"
	set "intellectual=!intellectual:~0,4!
	if "!intellectual:~0,3!" equ "-1." (set "intellectual_today=-100") else (if "!intellectual:~0,2!" equ "1." (set "intellectual_today=100"))
	if "!intellectual:~0,1!" equ "." (if "!intellectual:~1,1!" equ "0" (set "intellectual_today=!intellectual:~2,1!") else (set "intellectual_today=!intellectual:~1,2!"))
	if "!intellectual:~1,1!" equ "." if "!intellectual:~0,1!" equ "-" (if "!intellectual:~2,2!" equ "00" (set "intellectual_today=!intellectual:~2,2!") else (set "intellectual_today=-!intellectual:~2,2!"))
	if "%intellectual_today%" equ "00" set "intellectual_today=0"
	if "%intellectual_today:~0,2%" equ "-0" set "intellectual_today=-%intellectual_today:~2,1%"
	for %%i in (physical	emotional	intellectual) do del /f /q "%%i.txt" >nul
	
	set /a daydiff+=1
	echo s(2*(4*a(1))*%daydiff%/23) | bc.exe -l > "physical.txt"
	for /f %%i in (physical.txt) do set "physical=%%i"
	set "physical=!physical:~0,4!
	if "!physical:~0,3!" equ "-1." (set "physical_tomorrow=-100") else (if "!physical:~0,2!" equ "1." (set "physical_tomorrow=100"))
	if "!physical:~0,1!" equ "." (if "!physical:~1,1!" equ "0" (set "physical_tomorrow=!physical:~2,1!") else (set "physical_tomorrow=!physical:~1,2!"))
	if "!physical:~1,1!" equ "." if "!physical:~0,1!" equ "-" (if "!physical:~2,2!" equ "00" (set "physical_tomorrow=!physical:~2,2!") else (set "physical_tomorrow=-!physical:~2,2!"))
	if "%physical_tomorrow%" equ "00" set "physical_tomorrow=0"
	if "%physical_tomorrow:~0,2%" equ "-0" set "physical_tomorrow=-%physical_tomorrow:~2,1%"
	echo s(2*(4*a(1))*%daydiff%/28) | bc.exe -l > "emotional.txt"
	for /f %%i in (emotional.txt) do set "emotional=%%i"
	set "emotional=!emotional:~0,4!
	if "!emotional:~0,3!" equ "-1." (set "emotional_tomorrow=-100") else (if "!emotional:~0,2!" equ "1." (set "emotional_tomorrow=100"))
	if "!emotional:~0,1!" equ "." (if "!emotional:~1,1!" equ "0" (set "emotional_tomorrow=!emotional:~2,1!") else (set "emotional_tomorrow=!emotional:~1,2!"))
	if "!emotional:~1,1!" equ "." if "!emotional:~0,1!" equ "-" (if "!emotional:~2,2!" equ "00" (set "emotional_tomorrow=!emotional:~2,2!") else (set "emotional_tomorrow=-!emotional:~2,2!"))
	if "%emotional_tomorrow%" equ "00" set "emotional_tomorrow=0"
	if "%emotional_tomorrow:~0,2%" equ "-0" set "emotional_tomorrow=-%emotional_tomorrow:~2,1%"
	echo s(2*(4*a(1))*%daydiff%/33) | bc.exe -l > "intellectual.txt"
	for /f %%i in (intellectual.txt) do set "intellectual=%%i"
	set "intellectual=!intellectual:~0,4!
	if "!intellectual:~0,3!" equ "-1." (set "intellectual_tomorrow=-100") else (if "!intellectual:~0,2!" equ "1." (set "intellectual_tomorrow=100"))
	if "!intellectual:~0,1!" equ "." (if "!intellectual:~1,1!" equ "0" (set "intellectual_tomorrow=!intellectual:~2,1!") else (set "intellectual_tomorrow=!intellectual:~1,2!"))
	if "!intellectual:~1,1!" equ "." if "!intellectual:~0,1!" equ "-" (if "!intellectual:~2,2!" equ "00" (set "intellectual_tomorrow=!intellectual:~2,2!") else (set "intellectual_tomorrow=-!intellectual:~2,2!"))
	if "%intellectual_tomorrow%" equ "00" set "intellectual_tomorrow=0"
	if "%intellectual_tomorrow:~0,2%" equ "-0" set "intellectual_tomorrow=-%intellectual_tomorrow:~2,1%"
	for %%i in (physical	emotional	intellectual) do del /f /q "%%i.txt" >nul
	
	for %%a in ("yesterday"	"today"	"tomorrow") do (for %%i in ("physical"	"emotional"	"intellectual") do (echo %%~a_%%~i:!%%~i_%%~a!&echo !%%~i_%%~a!>>"output.txt"))
	if !physical_today! gtr !emotional_today! if !physical_today! gtr !intellectual_today! echo 0x66bb6a>>"output.txt"
	if !emotional_today! gtr !physical_today! if !emotional_today! gtr !intellectual_today! echo 0xef5350>>"output.txt"
	if !intellectual_today! gtr !physical_today! if !intellectual_today! gtr !emotional_today! echo 0x42a5f5>>"output.txt"
	rem if exist "display.exe" (start "" "display.exe") else (if exist "display.au3" start "" "display.au3")
	
	exit /b

:convjdate
	set /a Month1 = ( %MM% - 14 ) / 12
	set /a Year1  = %year% + 4800
	set /a jdate  = 1461 * ( %Year1% + %Month1% ) / 4 + 367 * ( %MM% - 2 -12 * %Month1% ) / 12 - ( 3 * ( ( %Year1% + %Month1% + 100 ) / 100 ) ) / 4 + %DD% - 32075
	