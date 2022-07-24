function ms_WriteLog
{
    <#
     .Synopsis
      Provides logging functionality

     .Description
      Writes messages into a log file, creates the file, if it doesn't exist, supports loglevels

     .Parameter logFileName
      Name of the log file.

     .Parameter message
      The message that should be displayed in thelog file.

     .Parameter msgLevel
      Defines the message level (VERBOSE, DEBUG, WARN, ERROR, INFO).
      If the message level is equal to or greater than the log level, the message will be sent ot the log file.
      VERBOSE < DEBUG < WARN < ERROR < INFO
      Info messages will be show every time.

      .Parameter logLevel
      Defines the log level (VERBOSE, DEBUG, WARN, ERROR, INFO).

     .Parameter dateFormat
      full = day,month,year,hour,minute,second,milliseconds (4 digits)
      short = hour,minute,second,milliseconds (4 digits)
      fullNoMilliseconds = as above, w/o milliseconds
      shortNoMilliseconds = as above, w/o milliseconds
      if not defined, shortNoMilliseconds is set by default

     .Example
       # Show a default display of this month.
       ms_WriteLog -filename ".\log\protocol.log" -message "This is just a log entry." -msgLevel "INFO" -logLevel "ERROR" -dateFormat "full"
       Leads to this output:
       INFO|24.07.2022 10:37:50.2345|This is just a log entry.
    #>
    [CmdletBinding()]
    Param (
        [Parameter (Mandatory)]
        [string]$logFileName,

        [Parameter (Mandatory)]
        [string]$message,

        [ValidateSet('VERBOSE','DEBUG','WARN','ERROR','INFO')]
        [string]$msgLevel = "INFO",

        [ValidateSet('VERBOSE','DEBUG','WARN','ERROR','INFO')]
        [string]$logLevel = "INFO",

        [ValidateSet('full','short','fullNoMilliseconds','shortNoMilliseconds')] 
        [string]$dateFormat = "shortNoMilliseconds"
    )
    $msgLevel=$msgLevel.ToUpper()
    $logLevel=$loglevel.ToUpper()
    $dateFormat=$dateFormat.ToLower()
    $checklevel= @("VERBOSE","DEBUG","WARN","ERROR","INFO")
    $scriptLogLevel = $checkLevel.IndexOf($logLevel)
    $messageLogLevel = $checkLevel.IndexOf($msgLevel)
    switch ($dateFormat)
    {
        full
        {$dateTimeString = "dd.MM.yyyy HH:mm:ss.ffff"}
        fullNoMilliseconds
        {$dateTimeString = "dd.MM.yyyy HH:mm:ss"}
        short
        {$dateTimeString = "HH:mm:ss.ffff"}
        shortNoMilliseconds
        {$dateTimeString = "HH:mm:ss"}
        default
        {$dateTimeString = "HH:mm:ss"}
     }
    $timeStamp = (Get-Date).toString($dateTimeString)
    $LogMessage = "$msgLevel|$timeStamp|$message"

    if (($messageloglevel -ge $scriptloglevel) -or $messageloglevel -eq -1)
    {
    $logFileExists = Test-Path $logFileName -PathType leaf
    if (-not $logFileExists)
	    {
        Add-content $LogFileName -value "-------------------------------------"
        Add-content $LogFileName -value "Version: $progversion"
        Add-content $LogFileName -value "Autor(en): $progAuthor"
        Add-content $LogFileName -value "-------------------------------------"
	    }
    Add-content $LogFileName -value $LogMessage
    }
Export-ModuleMember -Function ms_WriteLog
}
