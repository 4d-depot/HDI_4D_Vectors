
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Is Windows:C1573 && Get application info:C1599().SDIMode)
			INVOKE ACTION:C1439(ak return to design mode:K76:62)
		Else 
			CANCEL:C270
		End if 
End case 