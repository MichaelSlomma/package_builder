#region trimfix
#################################################################################################
#
# Korrekturroutinen
#
#################################################################################################

function fixPathVariable ([string] $stringToFix)
#
# entfernt führende und abschliessende Leerzeichen
# wandelt Slashes in Backslashes um
# entfernt abschließende Backslashes
#
{
    $stringToFix = $stringToFix.Trim()
    $stringToFix = $stringToFix.Replace("/","\")
    $stringToFix = $stringToFix.TrimEnd("\")
    return $stringToFix
}

function parseBoole ([string] $stringToBoole)
#
# wandelt die booleschen Ausdrücke 1, true, yes und ja in "true" um
# andere Ausdrücke werden als "false" interpretiert
#
{
    switch -regex ($stringToBoole.trim())
    {
        "^(1|true|yes|ja)$" { $returnString = $true }
        default { $returnString = $false }
    }
    return $returnString
}

#endregion