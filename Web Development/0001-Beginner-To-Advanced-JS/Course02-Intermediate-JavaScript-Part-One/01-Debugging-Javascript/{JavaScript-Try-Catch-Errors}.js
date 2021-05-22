console.log('hey');

return "hey"

try {
	// let's randomly try to throw an error
	if(Math.random() >= .5){
		 // The following code will throw:
		 // Uncaught TypeError: undefined is not a function(…)
		 undefined();
	}
	console.log("Whew, we made it");
} catch(e){
  console.log("We didn't make it. The error message is", e.message);
} finally {
  console.log("No matter what we will see this statement");
}


