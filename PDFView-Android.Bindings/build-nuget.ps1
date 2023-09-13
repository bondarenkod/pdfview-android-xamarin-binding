


$msbuild = "C:\Program Files\Microsoft Visual Studio\2022\Preview\MSBuild\Current\Bin\msbuild.exe"
& $msbuild /p:Configuration=Release PDFView-Android.Bindings.csproj



# Check if nuget is available
$nugetInstalled = $true

try {
    nuget | Out-Null
} catch {
    $nugetInstalled = $false
}

if (-not $nugetInstalled) {
    Write-Warning "NuGet executable not found, run the next command to install, close this window and re-run script:"
    Write-Warning "winget install --id Microsoft.NuGet --exact --accept-source-agreements --disable-interactivity --force"
    exit 1;
}

nuget pack Xamarin.Bindings.PDFView-Android.nuspec
