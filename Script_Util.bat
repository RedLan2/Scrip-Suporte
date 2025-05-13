@echo off
:loop
cls
echo Digite um numero da opcao desejada
echo.
echo [1] Informacoes da Maquina
echo [2] Limpeza de Arquivos Temporarios
echo [3] Limpeza de Disco
echo [4] Verificar arquivos corrompidos do Windows
echo [5] Otimizar Unidades
echo [6] Configuracoes do Sistema (msconfig)
echo [7] Opcoes de Desempenho (Efeitos Visuais do Windows)
echo [8] Desabilitar Modo de Hibernacao
echo [9] Resetar a conexao de rede (Necessario reiniciar)
echo [10] Fix inputlag
echo [11] Desativar servico de fax
echo [12] Desativar servico de gerenciamento de performance
echo [13] Desativar servico de gerenciamento de eventos do Windows
echo [14] Desativar servico Sysmain
echo [00] Sair
echo.
echo.

set /p opcao=Digite a opcao desejada:
if "%opcao%" == "1" goto op1
if "%opcao%" == "2" goto op2
if "%opcao%" == "3" goto op3
if "%opcao%" == "4" goto op4
if "%opcao%" == "5" goto op5
if "%opcao%" == "6" goto op6
if "%opcao%" == "7" goto op7
if "%opcao%" == "8" goto op8
if "%opcao%" == "9" goto op9
if "%opcao%" == "10" goto op10
if "%opcao%" == "11" goto op11
if "%opcao%" == "12" goto op12
if "%opcao%" == "13" goto op13
if "%opcao%" == "14" goto op14
if "%opcao%" == "00" goto op00

"Informacoes da Maquina"
	:op1
	Dxdiag
echo Operacao realizada com sucesso!
pause
goto loop

"Limpeza de Arquivos Temporarios"
	:op2
echo.
echo Excluindo arquivos da pasta C:\Windows\Temp
pause
	cd/ 
	cd \Windows\Temp
	rd /s /q "C:\Windows\Temp"
echo.
echo Operacao realizada com sucesso!
pause
echo.

echo Excluindo arquivos da pasta C:\Windows\Prefetch
pause
	cd/
	cd \Windows\Prefetch
	rd /s /q "C:\Windows\Prefetch"
echo.
echo Operacao realizada com sucesso!
pause
echo.

echo Excluindo arquivos da pasta C:\Windows\SoftwareDistribution\Download
pause
	cd/
	cd \Windows\SoftwareDistribution\Download
	rd /s /q "C:\Windows\SoftwareDistribution\Download"
echo.
echo Operacao realizada com sucesso!
pause
echo.

echo Excluindo arquivos da pasta Temp do Usuario
pause
	cd /
	cd %temp%
	rd /s /q "%temp%"
echo.
echo Operacao realizada com sucesso!
pause
echo.
goto loop

"Limpeza de Disco"
	:op3
	cleanmgr.exe
echo Operacao realizada com sucesso!
pause
goto loop

"Verificar arquivos corrompidos do Windows"	
	:op4
	sfc /scannow 	
echo Operacao realizada com sucesso!
pause
goto loop

"Otimizar Unidades"	
	:op5
	dfrgui.exe
echo Operacao realizada com sucesso!
pause
goto loop

"Configuracoes do Sistema (msconfig)"	
	:op6
	msconfig
echo Operacao realizada com sucesso!
pause
goto loop

"Opcoes de Desempenho (Efeitos Visuais do Windows)"
	:op7
	SystemPropertiesAdvanced.exe
echo Operacao realizada com sucesso!
pause
goto loop

"Desabilitar Modo de Hibernacao"
	:op8
	powercfg.exe /hibernate off
echo Operacao realizada com sucesso!
pause
goto loop

"Resetar a conexao de rede (Necessario reiniciar)"
	:op9
	ipconfig /release
	ipconfig /renew
	ipconfig /flushdns
	netsh winsock reset
echo Operacao realizada com sucesso!
pause
goto loop

"Fix inputlag"
	:op10
	bcdedit /set useplatformtick yes   
	bcdedit /set disabledynamictick yes  
	bcdedit /deletevalue useplatformclock false
	bcdedit /set nx AlwaysOff
	bcdedit /set tscsyncpolicy Enhanced FPS
	bcdedit /set tscsyncpolicy Legacy input
echo Operacao realizada com sucesso!
pause
goto loop

"Desativar servico de fax"
	:op11
	sc config fax start= disabled
echo Servico de fax desativado com sucesso!
pause
goto loop

"Desativar servico de gerenciamento de performance"
	:op12
	sc config PerfSvc start= disabled
echo Servico de gerenciamento de performance desativado com sucesso!
pause
goto loop

"Desativar servico de gerenciamento de eventos do Windows"
	:op13
	sc config eventlog start= disabled
echo Servico de gerenciamento de eventos do Windows desativado com sucesso!
pause
goto loop

"Desativar servico Sysmain"
	:op14
	sc config sysmain start= disabled
echo Servico Sysmain desativado com sucesso!
pause
goto loop

"Sair"
	:op00
	exit
:fim