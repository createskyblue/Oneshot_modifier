@echo off
:start
cls
title Oneshot存档工具 2018国庆版本 更新:加入几个回档点
echo. ########################################################
echo.
echo.              OneShot一次机会 存档修改器
echo.
echo.             by createskyblue LHW  QQ:1281702594
echo.
echo. ########################################################
echo.
:检查版本
if exist C:\Users\%USERNAME%\AppData\Local\Oneshot (set 版本=评委版本) else (set 版本=error)
if exist C:\Users\%USERNAME%\AppData\Roaming\Oneshot (set 版本=Steam正版) else (set 版本=error)
echo. ^>正在检查游戏版本!   默认检查C盘
if "%版本%"=="error" goto ERROR1
echo. ^>游戏版本: %版本%
if "%版本%"=="评委版本" goto 评委版本
if "%版本%"=="Steam正版" goto Steam
goto ERROR2
:Steam
set 存档备份=false
if exist lib\SAVE_BACK\TIME.DAT (
for /f "tokens=1*delims=:" %%i in ('findstr/n . lib\SAVE_BACK\TIME.DAT ^| findstr/b 1') do (
 set 备份时间=%%j
)
set 存档备份=true
)
echo. ^>游戏存档目录:C:\Users\%USERNAME%\AppData\Roaming\Oneshot
echo. 
echo. ########################################################
echo.                          功能表
echo.
echo.         1.打开存档目录
echo.         2.使游戏进度到达一周目结束
echo.         3.使游戏进度到达二周目结束
echo.         4.使游戏进度到达BARRENS末尾
echo.         5.使游戏进度到达GLEN末尾
echo.         6.使游戏进度到达REFUGE电梯
echo.         7.暴力删除存档
echo.         8.存档一键备份
echo.         9.备份存档一键回档 %备份时间%
echo.         0.进入DEBUG模式
:Steam版本选择功能
echo.
set /p 选择=^>请输入有效数字序号: 
if "%选择%"=="1" start ""  C:\Users\%USERNAME%\AppData\Roaming\Oneshot
if "%选择%"=="2" goto 一周目结束
if "%选择%"=="3" goto 二周目结束
if "%选择%"=="4" goto 使游戏进度到达BARRENS末尾
if "%选择%"=="5" goto 使游戏进度到达GLEN末尾
if "%选择%"=="6" goto 使游戏进度到达REFUGE电梯
if "%选择%"=="7" goto 删除存档
if "%选择%"=="8" goto 存档备份
if "%选择%"=="9" goto 备份回档
if "%选择%"=="0" goto DEBUG
goto Steam版本选择功能
:评委版本
echo. ^>温馨提示：此游戏为评委试玩版本，游戏内容不完整，仅供试玩
echo. ^>可以在Steam平台获取完整版本! 支持正版!
echo. ^>对于评委版本 由于游戏不完整 所以只能提供删除注册表功能
echo.
echo. ^>游戏存档目录:C:\Users\%USERNAME%\AppData\Local\Oneshot
echo.
echo. ########################################################
echo.                          功能表
echo.
echo.         1.删除注册表数据
echo.         2.打开存档目录
echo.         3.安全关闭程序
echo. 
echo.    说明：如果你在评委版本游戏过程中关闭游戏，将会把NIKO
echo.    杀死，又或者你游戏结束后想再玩一遍可以选择这个功能!
:评委版本选择功能
echo.
set /p 选择=^>请输入有效数字序号: 
if "%选择%"=="1" goto 删除注册表
if "%选择%"=="2" start "" C:\Users\%USERNAME%\AppData\Local\Oneshot
if "%选择%"=="3" exit
goto 评委版本选择功能
pause
:ERROR1
echo. ^>ERROR:01
echo. ^>严重错误，未检测到游戏存档 以及游戏版本号
echo. ^>程序终止 请联系开发者 QQ 1281702594
pause
exit
:ERROR2
echo. ^>ERROR:02
echo. ^>严重错误，程序损坏
echo. ^>程序终止 请联系开发者 QQ 1281702594
pause
exit
:ERROR3
echo. ^>ERROR:03
echo. ^>游戏程序检查错误，请重新指定游戏目录
echo. ^>没有检测到游戏关键文件，程序无法继续操作
pause
exit
:删除注册表
REG DELETE HKEY_CURRENT_USER\Software\Oneshot /f
Goto start
:警告
echo. ########################################################
echo.                  警告 存档覆盖危险性
echo.
echo.    为了安全，程序会进行存档备份，这将会覆盖掉备份目录
echo.
echo.   本程序开发者不会为存档丢失负责！解释权归本程序开发者！
echo.   存档操作时不要切断电源或者关闭程序，继续操作代表同意
echo.
echo.         1.取消
echo.         2.取消
echo.         3.取消
echo.         4.取消
echo.         5.取消
echo.         6.继续操作
echo.         7.取消
echo.
set /p 选择=^>请输入有效数字序号: 
if "%选择%"=="6" Goto :Eof
Goto start
:一周目结束
call :警告
call :存档备份操作
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE2\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
::copy lib\SAVE2\persistent.dat C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
::copy lib\SAVE2\save.dat C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
::copy lib\SAVE2\settings.conf C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>操作成功!
Goto Steam
:二周目结束
call :警告
call :存档备份操作
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE1\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>操作成功!
Goto Steam
:使游戏进度到达BARRENS末尾
call :警告
call :存档备份操作
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE4\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>操作成功!
Goto Steam
:使游戏进度到达GLEN末尾
call :警告
call :存档备份操作
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE5\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>操作成功!
Goto Steam
:使游戏进度到达REFUGE电梯
call :警告
call :存档备份操作
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE6\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>操作成功!
Goto Steam
:删除存档
call :警告
call :存档备份操作
call :删除存档操作
Goto Steam
:删除存档操作
echo. ^>正在操作中,请勿关闭程序或者切断电源
echo. ^>删除本地存档...
del C:\Users\%USERNAME%\AppData\Roaming\Oneshot\*.* /s/q/f
rd C:\Users\%USERNAME%\AppData\Roaming\Oneshot\save_backups
echo. ^>删除成功!
Goto :Eof
:存档备份
call :存档备份操作
goto Steam
:存档备份操作
if not exist lib\SAVE_BACK\TIME.DAT rd lib\SAVE_BACK
echo. ^>执行安全备份中...
echo. ^>创建备份文件...
md lib\SAVE_BACK
echo. ^>复制Oneshot存档到程序目录下的lib\SAVE_BACK\ ...
xcopy C:\Users\%USERNAME%\AppData\Roaming\Oneshot\*.* lib\SAVE_BACK\ /Y
echo %DATE:~0,4%/%DATE:~5,2%/%DATE:~8,2% %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%>lib\SAVE_BACK\TIME.DAT
echo. ^>操作完成!
Goto :Eof
:备份回档
set 存档备份=false
if exist lib\SAVE_BACK\TIME.DAT (
for /f "tokens=1*delims=:" %%i in ('findstr/n . lib\SAVE_BACK\TIME.DAT ^| findstr/b 1') do (
 set 备份时间=%%j
)
set 存档备份=true
)
if "%存档备份%"=="false" (
echo. ^>错误，没有备份!
goto Steam
)
call :警告
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE_BACK\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\ /Y
echo. ^>操作成功!
Goto Steam
:DEBUG
:验证游戏文件
cls
echo. ########################################################
echo.
echo.                     进入游戏DEBUG模式
echo.
echo.      警告，这个操作会导致游戏损坏，涉及到游戏文件操作
echo.  游戏 和 存档将会自动备份，如果游戏不正常请到Steam页
echo.  面验证完整性.
echo.
echo. ########################################################
echo.
echo.  请打开游戏文件目录，可以在Steam游戏属性中找到打开游戏文件选项
echo.  打开后在这里输入游戏路径! 
echo.  例如:E:\Program Files\Steam\steamapps\common\OneShot
echo.
set /p 游戏路径=请输入游戏路径 : 
echo.
echo. ^>验证游戏中...
if not exist "%游戏路径%\_______.exe" goto ERROR3
if not exist "%游戏路径%\Data" goto ERROR3
if not exist "%游戏路径%\steamshim.exe" goto ERROR3
if not exist "%游戏路径%\msvcrt-ruby220.dll" goto ERROR3
if not exist "%游戏路径%\Data\Map001.rxdata" goto ERROR3
echo. ^>游戏关键文件验证成功，可以继续操作!
pause
:DEBUG操作菜单
cls
echo.
echo. ########################################################
echo.                          功能表
echo.
echo.         1.进入DEBUG
echo.         2.退出DEBUG
echo. 
echo.
set /p 选择=^>请输入有效数字序号: 
if "%选择%"=="1" Goto 进入游戏DEBUG模式
if "%选择%"=="2" Goto 退出游戏DEBUG模式
Goto DEBUG操作菜单
:进入游戏DEBUG模式
call :警告
call :存档备份操作
echo. ^> 删除本地缓存
if exist "lib\Oneshot\Data" del "lib\Oneshot\Data" /q/s/f
echo. ^>备份游戏数据文件中...
md lib\Oneshot\Data
xcopy "%游戏路径%\Data\*.*" lib\Oneshot\Data
echo. ^>导入DEBUG存档
call :删除存档操作
echo. ^>复制文件中...
xcopy lib\SAVE3\*.* C:\Users\%USERNAME%\AppData\Roaming\Oneshot\
echo. ^>存档导入操作成功!
echo. ^>修改游戏数据文件中，请勿关闭电源或者关闭程序!
del "%游戏路径%\Data\Map001.rxdata"
copy "lib\DATA\Map001.rxdata" "%游戏路径%\Data\"
if not exist "%游戏路径%\Audio\BGM\DEBUG.ogg" (
copy "%游戏路径%\Audio\BGM\NavigateExtended.ogg" "%游戏路径%\Audio\BGM\DEBUG.ogg"
)
echo. ^>操作完成!
pause
goto DEBUG操作菜单
:退出游戏DEBUG模式
call :警告
echo. ^>检查游戏备份中...
if not exist "lib\Oneshot\Data\Map001.rxdata" (
echo. ^>致命错误：没有备份文件，无法退出DEBUG
echo. ^>请手动执行程序中的回档或者删除存档
echo. ^>完成上一步后到Steam页面执行检查游戏完整性
pause
exit
)
echo. ^>恢复游戏文件中
del "%游戏路径%\Data\Map001.rxdata"
copy "lib\Oneshot\Data\Map001.rxdata" "%游戏路径%\Data\"
echo. ^>恢复备份的存档,将自动在3秒后进行
ping 127.0.0.1 -n 3 >nul
goto 备份回档