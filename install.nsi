;PocketMine-MP Installer Script
;Written by Nerahikada

!pragma warning error all

;------------------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;------------------------------------------
;Information

  !define PRODUCT_NAME "PocketMine-MP"
  !define PRODUCT_VERSION "0.0.0"

  VIProductVersion "${PRODUCT_VERSION}.0"
  VIAddVersionKey ProductName "${PRODUCT_NAME}"
  VIAddVersionKey ProductVersion "${PRODUCT_VERSION}"
  VIAddVersionKey FileDescription "${PRODUCT_NAME} ${PRODUCT_VERSION}"
  VIAddVersionKey FileVersion "${PRODUCT_VERSION}"
  VIAddVersionKey LegalCopyright "Nerahikada"
  VIAddVersionKey Comment "https://github.com/Nerahikada/PocketMine-MP_Installer"

;------------------------------------------
;General

  Unicode true

  Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
  OutFile "${PRODUCT_NAME}-${PRODUCT_VERSION}.exe"

  BrandingText "${PRODUCT_NAME} ${PRODUCT_VERSION}"

  InstallDir "$EXEDIR\${PRODUCT_NAME}"

  RequestExecutionLevel user

  ;SetCompressor /solid lzma

;------------------------------------------
;Interface Settings

  !define MUI_ICON "assets\pocketmine.ico"

  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "assets\modern-header.bmp"
  !define MUI_WELCOMEFINISHPAGE
  !define MUI_WELCOMEFINISHPAGE_BITMAP "assets\modern-wizard.bmp"

  !define MUI_ABORTWARNING

  !define MUI_LANGDLL_ALLLANGUAGES

  ShowInstDetails show
  !define MUI_FINISHPAGE_NOAUTOCLOSE

  !define MUI_FINISHPAGE_RUN "$INSTDIR\start.cmd"

;------------------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "assets\LICENSE.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

;------------------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English" ; The first language is the default language
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Turkish"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"
  !insertmacro MUI_LANGUAGE "Asturian"
  !insertmacro MUI_LANGUAGE "Basque"
  !insertmacro MUI_LANGUAGE "Pashto"
  !insertmacro MUI_LANGUAGE "ScotsGaelic"
  !insertmacro MUI_LANGUAGE "Georgian"
  !insertmacro MUI_LANGUAGE "Vietnamese"
  !insertmacro MUI_LANGUAGE "Welsh"
  !insertmacro MUI_LANGUAGE "Armenian"
  !insertmacro MUI_LANGUAGE "Corsican"
  !insertmacro MUI_LANGUAGE "Tatar"
  !insertmacro MUI_LANGUAGE "Hindi"

;------------------------------------------
;Reserve Files

  !insertmacro MUI_RESERVEFILE_LANGDLL

;------------------------------------------
;Installer Sections

Section "PocketMine-MP" Section_1
  SetOutPath $INSTDIR
  File "PocketMine-MP.phar"
  File "start.cmd"
  SetOutPath "$INSTDIR\bin"
  File /r "bin\"
SectionEnd

SectionGroup "Development Plugins" Section_2
  Section /o "DevTools" Section_3
    SetOutPath "$INSTDIR\plugins"
    File "DevTools.phar"
  SectionEnd
  Section /o "DEVirion" Section_6
    SetOutPath "$INSTDIR\plugins"
    File "DEVirion_dev-45.phar"
  SectionEnd
SectionGroupEnd

Section "Visual C++ Runtime" Section_4
  SetOutPath $INSTDIR
  File "vc_redist.x64.exe"
  ExecWait "$INSTDIR\vc_redist.x64.exe /quiet /norestart"
  Delete "$INSTDIR\vc_redist.x64.exe"
SectionEnd

Section "Allow loopback connection" Section_5
  nsExec::Exec "powershell start-process CheckNetIsolation 'LoopbackExempt -a -n=Microsoft.MinecraftUWP_8wekyb3d8bbwe' -verb runas"
SectionEnd

;------------------------------------------
;Descriptions

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section_1} "Minimum files required for running PocketMine-MP"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section_2} "PocketMine-MP plugins for development"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section_3} "Development tools plugin for PocketMine-MP"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section_4} "Visual C++ Redistributable installs Microsoft C and C++ (MSVC) runtime libraries (required to run PHP)"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section_5} "Allow Minecraft to make a loopback connection to localhost"
  !insertmacro MUI_DESCRIPTION_TEXT ${Section_6} "Plugin used for debugging virions or plugins that use virions"
!insertmacro MUI_FUNCTION_DESCRIPTION_END
