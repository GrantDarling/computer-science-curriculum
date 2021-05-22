/* 
1. What is the difference between setInterval and setTimeout?

setInterval will execute code every x miliseconds until cleared while setTimeout will run onces at x miliseconds unless cleared

2. What is the difference between using setInterval and a loop? Why would you want to choose one over the other?

SeiInterval is asyncronous so it can be called at a specific time. However, a loop is syncronous so it is impossible to 
say exactly when you want it to execute 

3. What is the first parameter that setInterval and setTimeout accept?

A callback function

4. Why is it so important to store the result of setInterval and setTimeout in a variable?

So you can keep tract of its id to clear it 

5. What does asynchronous mean in the context of setTimeout and setInterval?

It does not follow the traditional pass of being run one after the other. It runs when you tell it to.
*/