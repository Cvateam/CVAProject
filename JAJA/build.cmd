@echo off
if not exist target mkdir target
if not exist target\classes mkdir target\classes


echo compile classes
javac -nowarn -d target\classes -sourcepath jvm -cp "jni4net\lib\jni4net.j-0.8.8.0.jar"; "jvm\classlibrary1\GreatTest.java" 
IF %ERRORLEVEL% NEQ 0 goto end


echo ClassLibrary1.j4n.jar 
jar cvf ClassLibrary1.j4n.jar  -C target\classes "classlibrary1\GreatTest.class"  > nul 
IF %ERRORLEVEL% NEQ 0 goto end


echo ClassLibrary1.j4n.dll
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc /nologo /warn:0 /t:library /out:ClassLibrary1.j4n.dll /recurse:clr\*.cs  /reference:"ClassLibrary1.dll" /reference:"jni4net\lib\jni4net.n-0.8.8.0.dll"
IF %ERRORLEVEL% NEQ 0 goto end


:end