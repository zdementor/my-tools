# Microsoft Developer Studio Project File - Name="entity" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=entity - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "entity.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "entity.mak" CFG="entity - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "entity - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "entity - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName "entity"
# PROP Scc_LocalPath "..\.."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "entity - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
F90=df.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "MAP_EXPORTS" /YX /FD /c
# ADD CPP /nologo /MD /W3 /O2 /I "..\..\..\libxml2\include\\" /I "..\..\include" /I "..\..\..\gtk2-win32\include\glib-2.0" /I "..\..\..\gtk2-win32\lib\glib-2.0\include" /I "..\common" /I "..\..\libs" /I "..\..\libs\nvtristrip" /I "..\..\..\STLPort\stlport" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "MAP_EXPORTS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 mathlib.lib glib-2.0.lib /nologo /dll /machine:I386 /def:".\entity.def" /libpath:"..\..\libs\mathlib\release" /libpath:"..\..\..\gtk2-win32\lib\\"
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=Copy to dir...
PostBuild_Cmds=copy Release\entity.dll "../../install/modules"
# End Special Build Tool

!ELSEIF  "$(CFG)" == "entity - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
F90=df.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "MAP_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /ZI /Od /I "..\..\shared" /I "..\..\..\libxml2\include" /I "..\..\include" /I "..\..\..\gtk2-win32\include\glib-2.0" /I "..\..\..\gtk2-win32\lib\glib-2.0\include" /I "..\common" /I "..\..\libs" /I "..\..\libs\nvtristrip" /I "..\..\..\STLPort\stlport" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "MAP_EXPORTS" /FR /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 mathlib.lib glib-2.0.lib /nologo /dll /debug /machine:I386 /def:".\entity.def" /pdbtype:sept /libpath:"..\..\libs\mathlib\debug" /libpath:"..\..\..\gtk2-win32\lib\\"
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=Copy to dir...
PostBuild_Cmds=copy Debug\entity.dll "../../install/modules"
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "entity - Win32 Release"
# Name "entity - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\eclassmodel.cpp
# End Source File
# Begin Source File

SOURCE=.\entity.cpp
# End Source File
# Begin Source File

SOURCE=.\entity.def
# PROP Exclude_From_Build 1
# End Source File
# Begin Source File

SOURCE=.\generic.cpp
# End Source File
# Begin Source File

SOURCE=.\group.cpp
# End Source File
# Begin Source File

SOURCE=.\light.cpp
# End Source File
# Begin Source File

SOURCE=.\miscmodel.cpp
# End Source File
# Begin Source File

SOURCE=.\plugin.cpp
# End Source File
# Begin Source File

SOURCE=.\targetable.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Group "API"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\include\ifilesystem.h
# End Source File
# Begin Source File

SOURCE=..\..\include\igl.h
# End Source File
# Begin Source File

SOURCE=..\..\include\imodel.h
# End Source File
# Begin Source File

SOURCE=..\..\include\ishaders.h
# End Source File
# Begin Source File

SOURCE=..\..\include\isurface.h
# End Source File
# Begin Source File

SOURCE=..\..\include\qerplugin.h
# End Source File
# Begin Source File

SOURCE=..\..\include\qertypes.h
# End Source File
# End Group
# Begin Source File

SOURCE=.\angle.h
# End Source File
# Begin Source File

SOURCE=.\angles.h
# End Source File
# Begin Source File

SOURCE=.\colour.h
# End Source File
# Begin Source File

SOURCE=.\entity.h
# End Source File
# Begin Source File

SOURCE=.\light.h
# End Source File
# Begin Source File

SOURCE=.\model.h
# End Source File
# Begin Source File

SOURCE=.\origin.h
# End Source File
# Begin Source File

SOURCE=.\plugin.h
# End Source File
# Begin Source File

SOURCE=.\scale.h
# End Source File
# Begin Source File

SOURCE=.\targetable.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# Begin Source File

SOURCE=.\Conscript
# End Source File
# End Target
# End Project
