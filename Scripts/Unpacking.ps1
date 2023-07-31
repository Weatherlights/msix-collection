param(
    $File = "C:\Users\hauke\OneDrive - weatherlights.com\Temp\Shared Downloads\indm.appx",
    $OutFolder = "C:\Users\hauke\Downloads\indm"
);

$sdkfolder = "C:\Program Files (x86)\Windows Kits\10\bin\10.0.22621.0\x64";
$MakeAppxEXE = "$sdkfolder\MakeAppx.exe"
$extension = ($File -split "\.")[($File -split "\.").Count-1]

if ( $extension -eq "appxbundle") {
    $arguments = "unbundle /p `"$File`" /d `"$OutFolder`""
} else {
    $arguments = "unpack /p `"$File`" /d `"$OutFolder`""
}

Start-Process $MakeAppxEXE -ArgumentList $arguments -Wait -NoNewWindow -PassThru