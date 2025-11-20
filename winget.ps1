# winget update --all --include-unknown --silent --accept-package-agreements --accept-source-agreements --disable-interactivity --location "F:\Logiciels"
# winget uninstall *** --purge --force

$apps = @(
    @{ Id = "WinDirStat.WinDirStat"; Name = "WinDirStat" },
    @{ Id = "Microsoft.VisualStudioCode"; Name = "Microsoft Visual Studio Code" },
    @{ Id = "CPUID.CPU-Z"; Name = "CPUID CPU-Z" },
    @{ Id = "Discord.Discord"; Name = "Discord" },
    @{ Id = "ElectronicArts.EADesktop"; Name = "EA app" },
    @{ Id = "EpicGames.EpicGamesLauncher"; Name = "Epic Games Launcher" },
    @{ Id = "Logitech.GHUB"; Name = "Logitech G HUB" },
    @{ Id = "Ubisoft.Connect"; Name = "Ubisoft Connect" },
    @{ Id = "VideoLAN.VLC"; Name = "VLC media player" },
    @{ Id = "ShareX.ShareX"; Name = "ShareX" },
    @{ Id = "Git.Git"; Name = "Git" }
    #@{ Id = "RazerInc.RazerInstaller.Synapse4"; Name = "Razer Synapse 4" },
    #@{ Id = "9PG8DNKL06M6"; Name = "Razer Chroma RGB for Streamers" }

)

$basePath = "F:\Logiciels"

foreach ($app in $apps) {
    $installPath = Join-Path $basePath $app.Name
    if (-not (Test-Path $installPath)) {
        New-Item -ItemType Directory -Path $installPath | Out-Null
    }

    $installed = winget list --id $app.Id | Select-String $app.Id

    if ($installed) {
        Write-Host "$($app.Name) est déjà installé. Mise à jour..."
        winget upgrade --id $app.Id `
            --exact `
            --silent `
            --accept-package-agreements `
            --accept-source-agreements
    } else {
        Write-Host "$($app.Name) n'est pas installé. Installation..."
        winget install --id $app.Id `
            --silent `
            --accept-package-agreements `
            --accept-source-agreements `
            --location "$installPath" `
            --force
            #--override "/DIR=`"$installPath`"" `
            #--override "--install-dir=`"$installPath`"" `
    }
}