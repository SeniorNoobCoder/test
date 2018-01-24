echo off
SET CLASSPATH=.;NutMoleGUI.jar;lib
for %%i in (lib/*.jar) do call cpappend.bat lib/%%i
@REM ECHO %CLASSPATH%
echo on
java -Xmx512m org.nutz.mole.gui %*