Lab 3: DataCamp Practice - Wrangling and Ggplot
------------------------------------------------

Today we're going to practice DataCamp skills with wrangling and plotting data; perhaps learn something about movies too. Remember to save your file in the Statistics Shared folder on your desktop before you begin and regularly click save throughout class. To share your folder with me, drage the folder into your Google Drive folder so it gets saved in the cloud.

We'll need three R packages for this lab.  Start by installing this one:
```r
install.packages("ggplot2movies")
```

Then load the three libraries we will need:
```r
library(tidyverse)
library(ggplot2)
library(ggplot2movies)
```

Now, let's take a peak at the first few movies:
```r
glimpse(movies)
```

**Question 1:** What are some other functions you have used to investigate dataframes and vectors? List all the ones you recall with a #note stating their purpose directly in your RScript.

Example: 
```r
head() 
#gives the first six rows of a dataframe.
```

# Plotting the Data

## Histograms

Histograms are a way of showing the distribution of the outcomes from a random experiment (like rolling a die). It's also useful in representing numerical data like movie ratings. Run the code below and investigate the graphs that are generated. If you get an error, read it carefully and try to troubleshoot before asking for help. *Maybe you forgot to load the packages that you wrote in the first lines?*

```r
#Histogram 1
movies %>% 
  ggplot(aes(rating)) + 
  geom_histogram()

#Histogram 2
movies %>% 
  ggplot(aes(year)) +
  geom_histogram()

#Histogram 3
movies %>% 
  ggplot(aes(r10)) + 
  geom_histogram()

#Histogram 4
movies %>% 
  ggplot(aes(votes)) + 
  geom_histogram() 

```
**Task 1:** Take a look at the movies dataframe *(Do you remember how to do this? One way is to store 'movies' in an object so it appears in the top right corner of RStudio. Then you can click on it to see the dataframe with rows and columns.)*

**Question 2:** Now that you see all of the columns, pick two new variables that seem interesting to you and make two histograms using the same code as in the 4 histograms above. I'll start you off with the first line of the code:

```r
#Histogram 5
movies %>%


#Histogram 6

```

**Reflection:** What do you notice about the histograms? What do you wonder? What type of data would you like to see presented on a histogram? Write your response in your Rscript file with a #note.


Boxplots and Scatterplots are two typical types of graphs that you will come across in the news, on social media, and in a Statistics classroom. PLay around with the code below to generate these types of graphs. Look at the labels on the x- and y- axes of the graphs and determine what story it might be telling about the data. Then answer the question below.

## Boxplots 

We can plot a few distributions side by side with a box plot. Here are distribution of movie ratings for movies with different mpaa ratings.  
**Note:** The box covers the middle 50% of the data; extending from the 25th percentile rating up to the 75th percentile rating. The number in the middle where the line cuts the box is called the median.

```r
movies %>% 
  filter(mpaa != "") %>%
  ggplot(aes(mpaa, rating)) + 
  geom_boxplot()
```

## Scatterplots

Scatterplots allow us to look at the relationship between two variables.

This plot of the relationship between movie length and movie rating is unfortunately ruined by a few ridiculously long movies.

```r
movies %>%
  ggplot(aes(length, rating)) +
  geom_point()
```

Let's make the same plot but limit it to movies with at least 10,000 votes. Edit the code to reflect this filter. Compe up with a short title to clarify what we're plotting ... something about movie ratings and lenght? Edit ggtittle() with your title.

```r
movies %>%
  filter(votes >= ________) %>%
  ggplot(aes(length, rating)) +
  geom_point() +
  ggtitle("____________")
```

Let's look at the relationship between budget and rating. I titled this one "Movie Rating v. Budget, min 10,000 votes" but you can change it to be consistent with your naming convention above.

```r
movies %>%
  filter(votes >= 10000) %>%
  ggplot(aes(budget, rating)) +
  geom_point() +
  ggtitle("Movie Rating v. Budget, min 10,000 votes")
```

and between number of votes and rating:

```r
movies %>%
  ggplot(aes(votes, rating)) +
  geom_point() +
  ggtitle("Movie Average Rating v. Number of Ratings")
```

**Task 2:** Save the two histograms you generated and save them in the "Statistics Shared" folder on your Desktop by choosing Export/Save as Image... Remember to save your work often on RStudio by clicking the blue save button.

# Data Wrangling

Now, let's practice with some of the data wrangling "verbs" we learned about on DataCamp.  We've already used *filter()*.

## top_n and select

We can find the 5 movies with the largest budgets and show the movie name, the budget and the year:

```r
movies %>%
  top_n(5, budget) %>%
  select(title, budget, year)
```

We can find the 10 highest rated movies and show the average rating in addition to the budget (note that this list runs past 10 due to ties):

```r
movies %>%
  top_n(10, rating) %>%
  select(title, budget, rating)
```

That list includes some obscure movies, let's use filter to limit our list to movies with at least 100 votes.  

```r
movies %>%
  filter(votes >= 100) %>%
  top_n(10, rating) %>%
  select(title, votes, rating)
```

Notice that to do this we filtered by votes before finding the top 10 in ratings.  

**Question 3:** How is our result different if we swap the order of those steps (with the code below)? How do you explain this difference? First run the code below to see the graph. Then use a #note to answer this question in the Rscript file.

```r
movies %>%
  top_n(10, rating) %>%
  filter(votes >= 100) %>%
  select(title, votes, rating)
```



## Arranging

You might also have been frustrated that when we looked at the top 10 movies by rating that they weren't ordered by rating (what kind of a top 10 list is that!?).  We can fix this using arrange:

```r
movies %>%
  filter(votes >= 100) %>%
  top_n(10, rating) %>%
  arrange(desc(rating)) %>%
  select(title, votes, rating)
```

**Task 3:** Write a chunk of code that will show the top 20 highest rated movies with at least 1000 votes. Make sure it runs properly and generates the correct answer. 

***If you are having a hard time with this task, stop here and review the DataCamp assignment in the Intro to Tidyverse topic:***

https://campus.datacamp.com/courses/introduction-to-the-tidyverse/data-wrangling-1?ex=1
***Make sure you are logged into your SA account so you can see your completed work.***

## Mutating

With *mutate* we can add new columns based on existing columns.  Suppose we're interest in how movies have changed over time and might be interested in looking at movies grouped by decade.  We can add a decade column.  To do this, I'll subtract 5 from the year and then round years to the 10's place.  I'll also use *factor* to tell R that the number that results from this calculation is a group or category.

Notice also that I'm starting this line of code with "movies = ...".  This is the way to overwrite the movies data with this new column added.

```r
movies = movies %>% 
mutate(decade = factor(round(year-5, -1)))
```

Now, let's go back to our box plots and look at movie ratings by decade.  I'll limit this to movies with at least 10,000 ratings:

```r
movies %>%
  filter(votes >= 10000) %>%
  ggplot(aes(decade, rating)) +
  geom_boxplot()

```

**Task 4:*** In your Rscript file, create a scatterplot of any dataset we have looked at together. You can use the 'movies' data from this lab, the 'starwars' data we looked at a few weeks ago, or the Motor Trend magazie 'mtcars' data. In a few sentences, write a #note in your Rscript file about why you compared those two variables and what you think the graph is telling you about those data.
