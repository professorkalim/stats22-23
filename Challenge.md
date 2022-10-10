01 Introduction to R
================
Statistics

# Challenge Problems
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


