@echo off
:start
cls
title Oneshot�浵���� 2018����汾 ����:���뼸���ص���
echo. ########################################################
echo.
echo.              OneShotһ�λ��� �浵�޸���
echo.
echo.             by createskyblue LHW  QQ:1281702594
echo.
echo. ########################################################
echo.
:���汾
if exist C:\Users\%USERNAME%\AppData\Local\Oneshot (set �汾=��ί�汾) else (set �汾=error)
if exist C:\Users\%USERNAME%\AppData\Roaming\Oneshot (set �汾=Steam����) else (set �汾=error)
echo. ^>���ڼ����Ϸ�汾!   Ĭ�ϼ��C��
if "%�汾%"=="error" goto ERROR1
echo. ^>��Ϸ�汾: %�汾%
if "%�汾%"=="��ί�汾" goto ��ί�汾
if "%�汾%"=="Steam����" goto Steam
goto ERROR2
:Steam
set �浵����=false
if exist lib\SAVE_BACK\TIME.DAT (
for /f "tokens=1*delims=:" %%i in ('findstr/n . lib\SAVE_BACK\TIME.DAT ^| findstr/b 1') do (
 set ����ʱ��=%%j
)
set �浵����=true
)
echo. ^>��Ϸ�浵Ŀ¼:C:\Users\%USERNAME%\AppData\Roaming\Oneshot
echo. 
echo. ########################################################
echo.                          ���ܱ�
echo.
echo.         1.�򿪴浵Ŀ¼
echo.         2.ʹ��Ϸ���ȵ���һ��Ŀ����
echo.         3.ʹ��Ϸ���ȵ������Ŀ����
echo.         4.ʹ��Ϸ���ȵ���BARRENSĩβ
echo.         5.ʹ��Ϸ���ȵ���GLENĩβ
echo.         6.ʹ��Ϸ���ȵ���REFUGE����
echo.         7.����ɾ���浵
echo.         8.�浵һ������
echo.         9.���ݴ浵һ���ص� %����ʱ��%
echo.         0.����DEBUGģʽ
:Steam�汾ѡ����
echo.
set /p ѡ��=^>��������Ч�������: 
if "%ѡ��%"=="1" start ""  C:\Users\%USERNAME%\AppData\Roaming\Oneshot
if "%ѡ��%"=="2" goto һ��Ŀ����
if "%ѡ��%"=="3" goto ����Ŀ����
if "%ѡ��%"=="4" goto ʹ��Ϸ���ȵ���BARRENSĩβ
if "%ѡ��%"=="5" goto ʹ��Ϸ���ȵ���GLENĩβ
if "%ѡ��%"=="6" goto ʹ��Ϸ���ȵ���REFUGE����
if "%ѡ��%"=="7" goto ɾ���浵
if "%ѡ��%"=="8" goto �浵����
if "%ѡ��%"=="9" goto ���ݻص�
if "%ѡ��%"=="0" goto DEBUG
goto Steam�汾ѡ����
:��ί�汾
echo. ^>��ܰ��ʾ������ϷΪ��ί����汾����Ϸ���ݲ���������������
echo. ^>������Steamƽ̨��ȡ�����汾! ֧������!
echo. ^>������ί�汾 ������Ϸ������ ����ֻ���ṩɾ��ע�����
echo.
echo. ^>��Ϸ�浵Ŀ¼:C:\Users\%USERNAME%\AppData\Local\Oneshot
echo.
echo. ########################################################
echo.                          ���ܱ�
echo.
echo.         1.ɾ��ע�������
echo.         2.�򿪴浵Ŀ¼
echo.         3.��ȫ�رճ���
echo. 
echo.    ˵�������������ί�汾��Ϸ�����йر���Ϸ�������NIKO
echo.    ɱ�����ֻ�������Ϸ������������һ�����ѡ���������!
:��ί�汾ѡ����
echo.
set /p ѡ��=^>��������Ч�������: 
if "%ѡ��%"=="1" goto ɾ��ע���
if "%ѡ��%"=="2" start "" C:\Users\%USERNAME%\AppData\Local\Oneshot
if "%ѡ��%"=="3" exit
goto ��ί�汾ѡ����
pause
:ERROR1
echo. ^>ERROR:01
echo. ^>���ش���δ��⵽��Ϸ�浵 �Լ���Ϸ�汾��
echo. ^>������ֹ ����ϵ������ QQ 1281702594
pause
exit
:ERROR2
echo. ^>ERROR:02
echo. ^>���ش��󣬳�����
echo. ^>������ֹ ����ϵ������ QQ 1281702594
pause
exit
:ERROR3
echo. ^>ERROR:03
echo. ^>��Ϸ���������������ָ����ϷĿ¼
echo. ^>û�м�⵽��Ϸ�ؼ��ļ��������޷���������
pause
exit
:ɾ��ע���
REG DELETE HKEY_CURRENT_USER\Software\Oneshot /f
Goto start
:����
echo. ########################################################
echo.                  ���� �浵����Σ����
echo.
echo.    Ϊ�˰�ȫ���������д浵���ݣ��⽫�Ḳ�ǵ�����Ŀ¼
echo.
echo.   �����򿪷��߲���Ϊ�浵��ʧ���𣡽���Ȩ�鱾���򿪷��ߣ�
echo.   �浵����ʱ��Ҫ�жϵ�Դ���߹رճ��򣬼�����������ͬ��
echo.
echo.         1.ȡ��
echo.         2.ȡ��
echo.         3.ȡ��
echo.         4.ȡ��
echo.         5.ȡ��
echo.         6.��������
echo.         7.ȡ��
echo.
set /p ѡ��=^>��������Ч�������: 
if "%ѡ��%"=="6" Goto :Eof
Goto start
:һ��Ŀ����
call :����
call :�浵���ݲ���
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE2\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
::copy lib\SAVE2\persistent.dat C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
::copy lib\SAVE2\save.dat C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
::copy lib\SAVE2\settings.conf C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>�����ɹ�!
Goto Steam
:����Ŀ����
call :����
call :�浵���ݲ���
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE1\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>�����ɹ�!
Goto Steam
:ʹ��Ϸ���ȵ���BARRENSĩβ
call :����
call :�浵���ݲ���
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE4\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>�����ɹ�!
Goto Steam
:ʹ��Ϸ���ȵ���GLENĩβ
call :����
call :�浵���ݲ���
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE5\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>�����ɹ�!
Goto Steam
:ʹ��Ϸ���ȵ���REFUGE����
call :����
call :�浵���ݲ���
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE6\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>�����ɹ�!
Goto Steam
:ɾ���浵
call :����
call :�浵���ݲ���
call :ɾ���浵����
Goto Steam
:ɾ���浵����
echo. ^>���ڲ�����,����رճ�������жϵ�Դ
echo. ^>ɾ�����ش浵...
del C:\Users\%USERNAME%\AppData\Roaming\Oneshot\*.* /s/q/f
rd C:\Users\%USERNAME%\AppData\Roaming\Oneshot\save_backups
echo. ^>ɾ���ɹ�!
Goto :Eof
:�浵����
call :�浵���ݲ���
goto Steam
:�浵���ݲ���
if not exist lib\SAVE_BACK\TIME.DAT rd lib\SAVE_BACK
echo. ^>ִ�а�ȫ������...
echo. ^>���������ļ�...
md lib\SAVE_BACK
echo. ^>����Oneshot�浵������Ŀ¼�µ�lib\SAVE_BACK\ ...
xcopy C:\Users\%USERNAME%\AppData\Roaming\Oneshot\*.* lib\SAVE_BACK\ /Y
echo %DATE:~0,4%/%DATE:~5,2%/%DATE:~8,2% %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%>lib\SAVE_BACK\TIME.DAT
echo. ^>�������!
Goto :Eof
:���ݻص�
set �浵����=false
if exist lib\SAVE_BACK\TIME.DAT (
for /f "tokens=1*delims=:" %%i in ('findstr/n . lib\SAVE_BACK\TIME.DAT ^| findstr/b 1') do (
 set ����ʱ��=%%j
)
set �浵����=true
)
if "%�浵����%"=="false" (
echo. ^>����û�б���!
goto Steam
)
call :����
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE_BACK\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\ /Y
echo. ^>�����ɹ�!
Goto Steam
:DEBUG
:��֤��Ϸ�ļ�
cls
echo. ########################################################
echo.
echo.                     ������ϷDEBUGģʽ
echo.
echo.      ���棬��������ᵼ����Ϸ�𻵣��漰����Ϸ�ļ�����
echo.  ��Ϸ �� �浵�����Զ����ݣ������Ϸ�������뵽Steamҳ
echo.  ����֤������.
echo.
echo. ########################################################
echo.
echo.  �����Ϸ�ļ�Ŀ¼��������Steam��Ϸ�������ҵ�����Ϸ�ļ�ѡ��
echo.  �򿪺�������������Ϸ·��! 
echo.  ����:E:\Program Files\Steam\steamapps\common\OneShot
echo.
set /p ��Ϸ·��=��������Ϸ·�� : 
echo.
echo. ^>��֤��Ϸ��...
if not exist "%��Ϸ·��%\_______.exe" goto ERROR3
if not exist "%��Ϸ·��%\Data" goto ERROR3
if not exist "%��Ϸ·��%\steamshim.exe" goto ERROR3
if not exist "%��Ϸ·��%\msvcrt-ruby220.dll" goto ERROR3
if not exist "%��Ϸ·��%\Data\Map001.rxdata" goto ERROR3
echo. ^>��Ϸ�ؼ��ļ���֤�ɹ������Լ�������!
pause
:DEBUG�����˵�
cls
echo.
echo. ########################################################
echo.                          ���ܱ�
echo.
echo.         1.����DEBUG
echo.         2.�˳�DEBUG
echo. 
echo.
set /p ѡ��=^>��������Ч�������: 
if "%ѡ��%"=="1" Goto ������ϷDEBUGģʽ
if "%ѡ��%"=="2" Goto �˳���ϷDEBUGģʽ
Goto DEBUG�����˵�
:������ϷDEBUGģʽ
call :����
call :�浵���ݲ���
echo. ^> ɾ�����ػ���
if exist "lib\Oneshot\Data" del "lib\Oneshot\Data" /q/s/f
echo. ^>������Ϸ�����ļ���...
md lib\Oneshot\Data
xcopy "%��Ϸ·��%\Data\*.*" lib\Oneshot\Data
echo. ^>����DEBUG�浵
call :ɾ���浵����
echo. ^>�����ļ���...
xcopy lib\SAVE3\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>�浵��������ɹ�!
echo. ^>�޸���Ϸ�����ļ��У�����رյ�Դ���߹رճ���!
del "%��Ϸ·��%\Data\Map001.rxdata"
copy "lib\DATA\Map001.rxdata" "%��Ϸ·��%\Data\"
if not exist "%��Ϸ·��%\Audio\BGM\DEBUG.ogg" (
copy "%��Ϸ·��%\Audio\BGM\NavigateExtended.ogg" "%��Ϸ·��%\Audio\BGM\DEBUG.ogg"
)
echo. ^>�������!
pause
goto DEBUG�����˵�
:�˳���ϷDEBUGģʽ
call :����
echo. ^>�����Ϸ������...
if not exist "lib\Oneshot\Data\Map001.rxdata" (
echo. ^>��������û�б����ļ����޷��˳�DEBUG
echo. ^>���ֶ�ִ�г����еĻص�����ɾ���浵
echo. ^>�����һ����Steamҳ��ִ�м����Ϸ������
pause
exit
)
echo. ^>�ָ���Ϸ�ļ���
del "%��Ϸ·��%\Data\Map001.rxdata"
copy "lib\Oneshot\Data\Map001.rxdata" "%��Ϸ·��%\Data\"
echo. ^>�ָ����ݵĴ浵,���Զ���3������
ping 127.0.0.1 -n 3 >nul
goto ���ݻص�