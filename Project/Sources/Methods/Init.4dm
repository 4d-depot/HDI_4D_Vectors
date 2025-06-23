//%attributes = {}

Form:C1466.trace:=False:C215

var $prompts:=ds:C1482.Prompts.all().toCollection()
Form:C1466.prompts:={values: $prompts.extract("Description"); index: 1}

Form:C1466.receipts:=cs:C1710.VectorManagement.new().calculateWithSelectedPrompt($prompts[1])