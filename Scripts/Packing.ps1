param(
    $OutFile = "C:\Users\hauke\OneDrive - weatherlights.com\Documents\Developing\MSIXSuite\Software\AutoHotkey\x64.appx",
    $Folder = "C:\Users\hauke\OneDrive - weatherlights.com\Documents\Developing\MSIXSuite\Software\AutoHotkey\x64",
    $SignFile = $true
);

$sdkfolder = "C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64";
$MakeAppxEXE = "$sdkfolder\MakeAppx.exe"
$SignTool = "$sdkfolder\SignTool.exe"
$MakePri = "$sdkfolder\MakePri.exe"

$arguments = "pack /p `"$OutFile`" /d `"$Folder`""
Start-Process $MakeAppxEXE -ArgumentList $arguments -Wait -NoNewWindow -PassThru
# & $MakeAppxEXE $arguments;
#.\MakeAppx.exe pack /p `"$OutFile`" /d `"$Folder`"

#cd $Folder;

#& $MakePri createconfig /cf ..\pri\configuration.xml /dq en-us_de-de /pv 10.0 /o
#& $MakePri new /pr . /cf ..\pri\configuration.xml /of ..\pri\resources.pri /mf AppX /o
#& $MakeAppxEXE pack /m AppxManifest.xml /f ../pri/resources.map.txt /p "$OutFile" /o
#& $SignTool sign /a /v /fd SHA256 "$OutFile"

if ( $SignFile ) {
    $arguments = "sign /a /v /tr http://timestamp.digicert.com /fd SHA256 `"$OutFile`""
    Start-Process $SignTool -ArgumentList $arguments -Wait -NoNewWindow -PassThru
}
