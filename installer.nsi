; Octave installer for Windows (NSIS).
; The version comes from CI: makensis /DOCTAVE_VERSION=1.0.0 installer.nsi

Unicode true

!ifndef OCTAVE_VERSION
  !define OCTAVE_VERSION "0.0.0"
!endif

!define APP_NAME "Octave"
!define APP_EXE "octave.exe"
!define UNINSTALL_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\Octave"

!include "MUI2.nsh"
!include "FileFunc.nsh"

Name "${APP_NAME}"
OutFile "octave-setup.exe"
InstallDir "$PROGRAMFILES64\Octave"
InstallDirRegKey HKCU "Software\Octave" ""
RequestExecutionLevel admin

Var StartMenuFolder

!define MUI_ABORTWARNING
!define MUI_ICON "windows\runner\resources\app_icon.ico"
!define MUI_UNICON "windows\runner\resources\app_icon.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE"
!insertmacro MUI_PAGE_DIRECTORY

!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Octave"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_RUN "$INSTDIR\${APP_EXE}"
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "French"

Section "Octave" SecMain
  SetOutPath "$INSTDIR"
  File /r "build\windows\x64\runner\Release\*.*"

  WriteRegStr HKCU "Software\Octave" "" $INSTDIR
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Octave.lnk" "$INSTDIR\${APP_EXE}"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Désinstaller Octave.lnk" "$INSTDIR\Uninstall.exe"
  !insertmacro MUI_STARTMENU_WRITE_END

  CreateShortcut "$DESKTOP\Octave.lnk" "$INSTDIR\${APP_EXE}"

  WriteRegStr HKLM "${UNINSTALL_KEY}" "DisplayName" "Octave"
  WriteRegStr HKLM "${UNINSTALL_KEY}" "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
  WriteRegStr HKLM "${UNINSTALL_KEY}" "DisplayIcon" "$INSTDIR\${APP_EXE}"
  WriteRegStr HKLM "${UNINSTALL_KEY}" "Publisher" "Charles Duchaussoy"
  WriteRegStr HKLM "${UNINSTALL_KEY}" "DisplayVersion" "${OCTAVE_VERSION}"
  WriteRegStr HKLM "${UNINSTALL_KEY}" "URLInfoAbout" "https://github.com/CharlesDuchaussoy/Octave"

  ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
  IntFmt $0 "0x%08X" $0
  WriteRegDWORD HKLM "${UNINSTALL_KEY}" "EstimatedSize" "$0"
SectionEnd

Section "Uninstall"
  RMDir /r "$INSTDIR"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
  Delete "$SMPROGRAMS\$StartMenuFolder\Octave.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\Désinstaller Octave.lnk"
  RMDir "$SMPROGRAMS\$StartMenuFolder"
  Delete "$DESKTOP\Octave.lnk"

  DeleteRegKey HKCU "Software\Octave"
  DeleteRegKey HKLM "${UNINSTALL_KEY}"
SectionEnd
