Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		Init
		
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			INVOKE ACTION:C1439(ak return to design mode:K76:62)
			//QUIT 4D
		Else 
			CANCEL:C270
		End if 
		
End case 
