'------------------------------------------------------
'
' Convert Account in domain to SID
'
'-------------------------------------------------------

Set objStdOut = Wscript.stdOut
Set args = Wscript.Arguments.Named
accountname = trim(args.Item("account"))
domainname = trim(args.Item("domain"))
'wscript.echo accountname
'wscript.echo domainname

if wscript.arguments.count = 2 then
 strComputer = "."
 Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")  
 Set objAccount = objWMIService.Get ("Win32_UserAccount.Name='" & accountname & "',Domain='" & domainname &"'") 

	Wscript.Echo objAccount.SID

else
	objStdOut.Write "Usage: cscript GetSIDfromaccount.vbs /account:[Account Name] /domain:[Domain Name]"
	objStdOut.close
	wscript.quit
end if