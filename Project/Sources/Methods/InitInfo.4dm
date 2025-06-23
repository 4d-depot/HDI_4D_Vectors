//%attributes = {"invisible":true}
var Infos : Collection
var objTabs : Object

Try
	Infos:=ds:C1482.INFO.all().orderBy("PageNumber").toCollection()
	objTabs:=New object:C1471("values"; Infos.extract("TabTitle"); "index"; 0)
End try