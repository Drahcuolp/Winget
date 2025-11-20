# Upgrade all user-scope packages
winget upgrade --all --scope user 

# Upgrade all machine-scope packages (requires elevation)
Start-Process winget -ArgumentList "upgrade --all --scope machine" -Verb RunAs