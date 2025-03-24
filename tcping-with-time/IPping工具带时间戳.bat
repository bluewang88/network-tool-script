@echo off
set h=%time:~0,2%
set h=%h: =0%
set timedate=%date:~0,4%%date:~5,2%%date:~8,2%-%h%%time:~3,2%%time:~6,2%
set /p host=host:

REM 创建保存日志的目录
set logdir=C:\PingLogs
if not exist %logdir% (
    mkdir %logdir%
)

set logfile=%logdir%\ping_%host%_%timedate%.log
echo testing-ipaddr=%host% > %logfile%

:loop
for /f "tokens=* skip=2" %%A in ('ping %host% -n 1') do (
    echo %date:~0,-3% %time:~0,-3% %%A>>%logfile%
    echo %date:~0,-3% %time:~0,-3% %%A
    timeout /t 1 /nobreak>nul
    goto loop
)
pause>nul
