
If (Form:C1466.customPrompt#"")
	Form:C1466.receipts:=cs:C1710.VectorManagement.new().calculate(Form:C1466.customPrompt; Form:C1466.OpenAIKey)
End if 

