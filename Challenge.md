01 Introduction to R
================
Statistics

# Challenge Problems

R has many built in functions and many more that can be added as parts
of packages. To find out how a function works you can type “?” and then
the name of the function. This will pull up instructions within the help
tab in your lower right window. The most useful parts of these
instructions are often the examples given at the bottom. Try typing in the following lines one at a time

``` r
A1 <- 2:10
A1

sum(A1)

?sum
```
Look at the bottom right pane. A help window should have appeared telling you what the sum function does. Read through it and let me know if you have any questions.

# Functions

For the two challenge problems, you will need to figure out which function will help you calculate the answer. Do a little reading in the help section about the following functions by using the ? 

```r
?min
?max
?length
?mean
?cumsum
?cumprod
```

**Challenge 1:**

If you place one grain of rice on the first space on a chessboard and
two on the second space and four on the third and so on (doubling every
time), how many grains of rice will you need to fill the chessboard
(which has 64 spaces)? Try writing one line of R code that will solve
this problem.

# Logical Statements

You can also enter logical statements into R – that is, statements that
will return true or false. You can then do mathematics on these values
with true taking the value 1 and false the value 0. Try entering each of
the following statements in turn and make sure that you understand why
you are getting each output.

``` r
x <- c(20,25,23,27, 28)
x > 23
x >= 23
x == 20
7*(x >= 23)+3
sum(x>=23)
x %% 5
(x %% 5) == 0
sum((x %% 5) == 0)
```

You can make your logical statements more complicated by introducing
ands and ors (& and \| in R).

``` r
x <- c(20,25,23,27, 28)
(x == 20) & (x == 28)
(x == 20) | (x == 28)

(x %% 5 ==0 ) | (x %% 7 ==0)

sum((x %% 5 ==0) | (x %% 7 ==0))
```

**Challenge 2:** Going back to the rice and chessboard scenario, if you have one million
grains of rice how many spaces can you fill before running out? Try to
write one line of code to solve this problem.


