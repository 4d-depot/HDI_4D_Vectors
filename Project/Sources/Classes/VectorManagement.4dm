//****************************************************************
// Function to calculate image similarities based on the custom prompt
Function calculate($prompt : Text; $apiKey : Text) : Collection
	
	//If no key is found, alert the user
	If ($apiKey="")
		ALERT:C41("Please provide your OpenAI API key.")
		return []
	End if 
	
	//If trace mode is on, start 4D's TRACE debugger
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Proceed only if both prompt and API key are available
	If ($prompt#"")
		
		// Generate a vector from the custom prompt using the AIManagement class
		var $vector:=cs:C1710.AIManagement.new($apiKey).generateVector($prompt)
		
		// Calculate similarities between the prompt vector and all image vectors
		var $recipeList:=This:C1470._calculateVectors($vector)
		
		// Return the receipts ordered by cosine similarity (most similar first)
		return $recipeList.orderBy("cosineSimilarity desc")
		
	Else 
		// If no prompt, returns empty collection
		return []
		
	End if 
	
	
	//****************************************************************
	// Calculates receipt similarity based on a selected prompt object
Function calculateWithSelectedPrompt($prompt : cs:C1710.PromptsEntity) : Collection
	
	//If trace mode is on, start 4D's TRACE debugger
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Use precalculated vector from the selected prompt and calculate similarities
	var $recipeList:=This:C1470._calculateVectors($prompt.Vector)
	
	// Return the receipts ordered by cosine similarity (most similar first)
	return $recipeList.orderBy("cosineSimilarity desc")
	
	
	
	//****************************************************************
	// Calculate and store similarity metrics for all receipts
shared Function _calculateVectors($vector : 4D:C1709.Vector) : Collection
	var $recipe : Object
	var $recipeList:=ds:C1482.Recipes.all().toCollection()
	
	// Iterate over each picture and calculate similarity scores
	For each ($recipe; $recipeList)
		
		$recipe.cosineSimilarity:=$vector.cosineSimilarity($recipe.Vector)
		$recipe.dotSimilarity:=$vector.dotSimilarity($recipe.Vector)
		$recipe.euclideanDistance:=$vector.euclideanDistance($recipe.Vector)
		
	End for each 
	
	// Return the updated picture list
	return $recipeList