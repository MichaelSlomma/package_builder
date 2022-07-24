#
# Package Builder
#

$progname = "Package Builder"
$progauthor = "Michael Slomma"
$progversion = "0.0.1"
$today = Get-Date -format "dd.MM.yyyy"

# Historie
<#
24.07.2021 (MSL) - first preview

#>


# load GUI assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -AssemblyName System.Web
Add-Type -AssemblyName System.Drawing


#region prepare Main Window
#################################################################
# Globale Abstände setzen | Type Padding
#################################################################
$System_Windows_Forms_Padding = New-Object System.Windows.Forms.Padding
$System_Windows_Forms_Padding.All = 3
$System_Windows_Forms_Padding.Bottom = 3
$System_Windows_Forms_Padding.Left = 3
$System_Windows_Forms_Padding.Right = 3
$System_Windows_Forms_Padding.Top = 3

#################################################################
# Bilddateien für Buttons definieren | Type Image
#################################################################
$setupimage = [System.Drawing.Image]::FromFile(".\img\cogwheel2.ico")
$showimage = [System.Drawing.Image]::FromFile(".\img\show.ico")
$exitimage = [System.Drawing.Image]::FromFile(".\img\exit.ico")
$aboutimage = [System.Drawing.Image]::FromFile(".\img\about.ico")
$saveimage = [System.Drawing.Image]::FromFile(".\img\save.ico")
$downloadimgae = [System.Drawing.Image]::FromFile(".\img\download.ico")
$cancelimage = [System.Drawing.Image]::FromFile(".\img\cancel.ico")
$checkmarkimage = [System.Drawing.Image]::FromFile(".\img\checkmark.ico")
$minusimage = [System.Drawing.Image]::FromFile(".\img\minus.ico")
$plusimage = [System.Drawing.Image]::FromFile(".\img\plus.ico")
$helpimage = [System.Drawing.Image]::FromFile(".\img\help.ico")
$aboutimage = [System.Drawing.Image]::FromFile(".\img\about.ico")

#################################################################
# Hauptfenster definieren | Type: Form
#################################################################
$formMain = New-Object System.Windows.Forms.Form
$formMain.Text = $progname
$formMain.Name = "Main"
$formMain.ClientSize = "400,350"
$formMain.StartPosition = "CenterScreen"
$formMain.FormBorderStyle = "FixedDialog"
$formMain.MaximizeBox = $false

#################################################################
# Statusbar | Type: StatusBar
#################################################################
$statusBar = New-Object System.Windows.Forms.StatusBar
$statusBar.TabIndex = 0
$statusBar.Name = "statusBar"
$statusBar.Text = "Statusbar"
$statusBar.Size = '284,22'
$statusBar.Location = '0,240'
$statusBar.DataBindings.DefaultDataSourceUpdateMode = 0
$formMain.Controls.Add($statusBar)
#################################################################

#region Menü
#################################################################
# Menüstreifen | Type: Form
#################################################################
$MainMenu = New-Object System.Windows.Forms.MenuStrip
$MainMenu.BackColor = "whitesmoke"
$formMain.Controls.Add($MainMenu)

# Datei #
$menuFile = New-Object System.Windows.Forms.ToolStripMenuItem
$menuFile.Text = "Datei"
$mainmenu.items.add($menuFile)

$menuOptions = New-Object System.Windows.Forms.ToolStripMenuItem
$menuOptions.Text = "Einstellungen"
$menuOptions.Image = $setupimage
$menuOptions.ShortcutKeys = "Alt, O"
$menuOptions.Add_Click({ })
$menuFile.Dropdownitems.add($menuOptions)

$menuSeperator1 = New-Object System.Windows.Forms.ToolStripSeparator
$menufile.Dropdownitems.add( $menuSeperator1 )

$menuExit = New-Object System.Windows.Forms.ToolStripMenuItem
$menuExit.Text = "Verlassen"
$menuExit.image = $exitimage
$menuExit.ShortcutKeys = "Alt, X"
$menuExit.Add_Click({ $formMain.close() })
$menufile.Dropdownitems.add($menuexit)

# ? #
$menuhelp = New-Object System.Windows.Forms.ToolStripMenuItem
$menuhelp.Text = "?"
$mainmenu.items.add($menuhelp)

$menuHilfe = New-Object System.Windows.Forms.ToolStripMenuItem
$menuHilfe.Text = "Hilfe / Anleitung"
$menuHilfe.Image = $helpimage
$menuHilfe.ShortcutKeys = "Alt, H"
$menuHilfe.Add_Click({ ii ".\doc\help.html" })
$menuHelp.Dropdownitems.add($menuHilfe)

$menuAbout = New-Object System.Windows.Forms.ToolStripMenuItem
$menuAbout.Text = "Über"
$menuAbout.Image = $aboutimage
$menuAbout.ShortcutKeys = "Alt, A"
$menuAbout.Add_Click({ about })
$menuHelp.Dropdownitems.add($menuAbout)
#endregion

#endregion

$formMain.ShowDialog()| Out-Null