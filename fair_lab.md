Ray Fair: Predicting the Results of Presidential Elections
-----------------------------------------

# Chapter 1: It's the Economy, Stupid

* First Read Chapter 1, "It's the Economy, Stupid" and then run the following code and answer the chapter one questions in a Google Doc.

## Getting the Data

```r
library(tidyverse)

fair = read.table("https://fairmodel.econ.yale.edu/vote2012/pres.txt",
                  header=TRUE)

View(fair)
```

Explanation of Variables
========================================================

**VP:**: Democratic share of the two-party presidential vote

**I:** 1 if there is a Democratic presidential incumbent at the time of the
election and −1 if there is a Republican presidential incumbent

**DPER:** 1 if a Democratic presidential incumbent is running again, −1
if a Republican presidential incumbent is running again, and 0
otherwise.

**DUR:** 0 if either party has been in the White House for one term, 1 [−1] if
the Democratic [Republican] party has been in the White House for
two consecutive terms, 1.25 [−1.25] if the Democratic [Republican]
party has been in the White House for three consecutive terms, 1.50
[−1.50] if the Democratic [Republican] party

**WAR:** 1 for the elections of 1918, 1920, 1942, 1944, 1946, and 1948, and
0 otherwise.

**G:** growth rate of real per capita GDP in the ﬁrst three quarters of the
on-term election year (annual rate).

**P:** absolute value of the growth rate of the GDP deﬂator in the ﬁrst 15
quarters of the administration (annual rate) except for 1920, 1944,
and 1948, where the values are zero.

**Z:** number of quarters in the ﬁrst 15 quarters of the administration in
which the growth rate of real per capita GDP is greater than 3.2
percent at an annual rate except for 1920, 1944, and 1948, where
the values are zero.

___
**Question 1:** Compare this data to the data table on page 12 of your reading.  What differences do you see?

___

## Calculating Incumbent Vote Share

```r
fair = 
fair %>%
  mutate(incumbent_vote_share = 
           ifelse(I==1, VP, 100-VP))
```

## Reproducing Figure 1-1

```r
fair %>% ggplot(aes(G, incumbent_vote_share, label=YEAR))+
  geom_label()
```
adding a best fit line

```r
fair %>% ggplot(aes(G, incumbent_vote_share, label=YEAR))+
  geom_label()+
  geom_smooth(method="lm", se=FALSE)
```

___
**Question 2:** In which election(s) did the incumbent candidate most outperform what we might expect based on GDP growth?

___

___
**Question 3:** In which election(s) did the incumbent candidate most underperform what we might expect based on GDP growth?

___

# Chapter 2: The Tools in Seven Easy Lessons

* First read *Monday*, *Tuesday*, and *Wednesday* then run the following code and answer the following questions.

## Getting an Equation for the Best Fit Line

```r
best_fit_line = 
  lm(incumbent_vote_share ~ G, data=fair)

best_fit_line
```
## Making Predictions using the Best Fit Line

```r
fair$predicted_incumbent_vote_share =
predict(best_fit_line)
```

## Finding the Errors

```r
fair = 
fair %>% 
mutate(error = 
        incumbent_vote_share - 
        predicted_incumbent_vote_share)
        
View(fair)
```
## Finding the Sum of the Squared Errors

```r
fair %>%
  summarize(SSE = sum(error^2),
            MSE = mean(error^2),
            RMSE = sqrt(mean(error^2)))
```
...Dividing by n-2 instead of n...

```r
fair %>%
  summarize(SSE = sum(error^2),
            adj_MSE = SSE/(length(error)-2),
            standard_error = sqrt(adj_MSE))
```
* Now read Thursday, Lesson 4

Create a histogram of the errors of our best-fit line:

```r
fair %>% ggplot(aes(error)) + geom_histogram(binwidth=2)
```
___
**Question 4:** Do the errors appear to be roughly normally distributed?

___

Calculate the portion of the errors are within 1 standard error.

```r
fair %>% summarize(mean(abs(error)<4.9))
```
Calculate the portion of the errors are within 2 standard error2.

```r
fair %>% summarize(mean(abs(error)<2*4.9))
```

___
**Question 5:** In a normal distribution roughly 68% of values should be within 1 standard deviation and roughly 95% within 2.  Is this what you found for the errors of our best-fit line?

___

## Find the standard error in the slope.

The output of the following code shows that the slope of the best-fit-line for incumbent vote share versus GDP growth is 0.89 with a standard error of 0.18.

```r
summary(best_fit_line)
```

How many standard errors is our slope away from zero?

```r
0.8787/0.1761
```
___
**Question 6:** Our slope is roughly 5 standard errors away from zero.  How would you explain what that means?

___

* Now read Friday, Lesson 5

