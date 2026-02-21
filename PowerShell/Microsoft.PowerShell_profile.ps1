# make the prompt pretty
function prompt { $esc = [char]27; return "$($esc)[38;5;208mPS $($esc)[38;5;45m$PWD$($esc)[38;5;15m> " }

# --- Prefer portable Git, but avoid shadowing Windows tools ---
# Remember to modify the GitRoot reference when updating Git!
$GitRoot   = 'C:\Users\{user}\OneDrive - {org}\Documents\Platforms\git\2.51.1'
$GitCmd    = Join-Path $GitRoot 'cmd'
$GitUsrBin = Join-Path $GitRoot 'usr\bin'
$GitExe    = Join-Path $GitCmd  'git.exe'

if (Test-Path $GitExe) {
    # Start from current process PATH, remove junk + any existing Git entries…
    $parts = @()
    $seen  = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)

    foreach ($p in ($env:Path -split ';')) {
        if ([string]::IsNullOrWhiteSpace($p)) { continue }
        if ($p -eq '\cmd' -or $p -eq '\usr\bin') { continue }             # tidy previous mistakes
        if ($p -ieq $GitCmd -or $p -ieq $GitUsrBin) { continue }          # we’ll reinsert
        if ($seen.Add($p)) { $parts += $p }
    }

    # Build: Git cmd FIRST, then your existing PATH, then usr\bin LAST
    $env:Path = (@($GitCmd) + $parts + @($GitUsrBin)) -join ';'

    # Force real Notepad (Git ships a wrapper named 'notepad' in usr\bin)
    Set-Alias notepad "$env:WINDIR\System32\notepad.exe"

    # Prefer Windows OpenSSH for both shell and Git
    $env:GIT_SSH = Join-Path $env:WINDIR 'System32\OpenSSH\ssh.exe'
}
