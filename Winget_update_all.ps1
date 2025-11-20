# Upgrade all user-scope packages
winget upgrade --all --scope user --accept-package-agreements --accept-source-agreements --disable-interactivity --silent --force

# Upgrade all machine-scope packages (requires elevation)
Start-Process winget -ArgumentList "upgrade --all --scope machine --accept-package-agreements --accept-source-agreements --disable-interactivity --silent --force" -Verb RunAs