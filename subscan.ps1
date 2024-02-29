$subnet = '192.168.1'
(1..254) | foreach {
	$ip = "$subnet.$_"
	$props = @{
		'IP' = $ip ;
		'Name' = (Resolve-DnsName $ip -ErrorAction SilentlyContinue | select -ExpandProperty NameHost) ;
		'Response' = (Test-Connection $ip -Quiet -Count 1)
	}
	$obj = New-Object -TypeName psobject -Property $props
	Write-Output $obj
} 
