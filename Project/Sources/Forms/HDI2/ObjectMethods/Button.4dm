
If (Form:C1466.prompts.currentValue#"")
	var $prompt:=ds:C1482.Prompts.query("Description=:1"; Form:C1466.prompts.currentValue)[0]
	Form:C1466.receipts:=cs:C1710.VectorManagement.new().calculateWithSelectedPrompt($prompt)
End if 

