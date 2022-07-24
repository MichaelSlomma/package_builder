
function ms_StartXML
{
    <#
     .Synopsis
      Starts a XML file.

     .Description
      Starts a XML file.

     .Parameter fileName
      Name of the xml file.

     .Parameter topNode
      Name of the very top node.

     .Parameter encoding
      Defines the XML encoding. Default = UTF8.

     .Example
       # Show a default display of this month.
       ms_StartXML -filename ".\xml\config.xml" -topNode "config" -encoding UTF8
    #>
    param
    (
        [Parameter (Mandatory)]
        [string]$filename,

        [Parameter (Mandatory)]
        [string]$topNode,

        [ValidateSet('ascii','bigendianunicode',"default",'oem','unicode','utf7','utf8','utf8BOM','utf8NoBOM','utf32')]
        [string]$encoding = "utf8"
    )
    $global:XmlWriter = New-Object System.XMl.XmlTextWriter($filename,$global:encoding)
    $XmlWriter.Formatting = "Indented"
    $XmlWriter.Indentation = "4"

    $xmlWriter.WriteStartDocument()

    $xmlWriter.WriteStartElement($topNode)

    Export-ModuleMember -Function ms_StartXML
}

function ms_CloseXML
{    
    <#
     .Synopsis
      Closes an open XML file.

     .Description
      Closes an open XML file.
    #>
    $xmlWriter.Finalize
    $xmlWriter.Flush
    $xmlWriter.Close()
    Export-ModuleMember -Function ms_CloseXML
}