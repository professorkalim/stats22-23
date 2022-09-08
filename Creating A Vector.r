#INSTRUCTIONS: Read all of the text and follow the examples below. As you are reading, you will come across questions to asnwer and tasks to complete. Each task will require you to write a chunk of code and run it. As long as you do not come across any errors, you may continue. If there is an error in the console after you run your code, you MUST troubleshoot the error before moving forward.

#R is an object oriented code, which means you "create" objects that hold different bits of information. Below are several ways of creating objects using functions and operators.

#Creating vectors - Using the concatenate function c() we can combine values into a list. Type ?c and run it to see the help page for the concatenate function. The help window will appear in the bottom right corner of your screen.

#Using the assignment operator "=" or "<-" you can assign the vector c() to an object.

#Example: Create a list of numbers (integer or decimal) using the concatenate function. Separate each number with a comma.
A=c(1,2,3,4,5,6)

#Task: Create a list of real numbers and assign it to an object called B:
B

#Example: Type the name of the object inside each of the functions below to find out more about the objects.

length(A)
#returns the length, or number of elements in the object

str(A) 
class(A)
#returns the type of the object

summary(A) 
#returns summary statistics on the object

table(A)
#returns counts of the different unique elements in the object

#Task: Investigate object B using the above functions.


#Example: Create a list of words using the c() function
A1 = c("california","new york","texas", "maine","connecticut","arizona","nevada","ohio")
#This type of list is known as categorical data. Investigate it by running the same codes as in the first task:
summary(A1)
table(A1)
length(A)
str(A1) 
class(A1)

#Task: Create a list of words using the c() function. The words can be anything you like. Assign the vector to an object called B1 on the line below.


#Example: Make a vector by creating an object that is a series of numbers. The colon is a shorthand symbol for creating a series.
e1 = 1:6
e2 = 1.5:6
#Task: Make a new series and save it in e3 below.
e3 = 


#Task: Investigate the objects you just created. 
length()
summary()
class()
table()
str() 
#Question: How is the vector you created in object e1 different from the vector you created object A? How are they different?
#Answer:

#Example: Make a vector by creating an object that is a sequence of numbers. The first argument in the function is the first value, the second is the last value, and the the third argument defines the increments of the sequence.

f1 = seq(1, 6, by=1)
f2 = seq(1, 60, by=10)
#Create a sequence of your choosing and assign it to an object called f3:
f3


#You can combine vectors of the same length using calculator commands you learned on the last assignment.
#Example: Combine the sequences f1 and f2
f1+f2
f1-f2
f1/f2
f1/f2
f2/f1
f1*f2
f1^f2

f1<f2
f2<=f1
f2>f1
f1>=f2
f1==f2
f1!=f2

#Task: Use the object f3 along with any other numerical object you have created today in the same way as the example above.


#NOTE:Here are two useful functions for your reference. The first one lists the objects you have created. The second one removes all of the objects you have created.
ls() 
#DO NOT RUN THE NEXT LINE. Using the rm() function this way removes objects you have created. If you run it now, it will remove all of the objects you created.
rm(list=ls())

