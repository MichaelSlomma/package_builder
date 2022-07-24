#region trimfix
#################################################################################################
#
# Korrekturroutinen
#
#################################################################################################

function fixPathVariable ([string] $stringToFix)
#
# entfernt f�hrende und abschliessende Leerzeichen
# wandelt Slashes in Backslashes um
# entfernt abschlie�ende Backslashes
#
{
    $stringToFix = $stringToFix.Trim()
    $stringToFix = $stringToFix.Replace("/","\")
    $stringToFix = $stringToFix.TrimEnd("\")
    return $stringToFix
}

function parseBoole ([string] $stringToBoole)
#
# wandelt die booleschen Ausdr�cke 1, true, yes und ja in "true" um
# andere Ausdr�cke werden als "false" interpretiert
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