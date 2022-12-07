---
title: "Game Logos"
author: "Kalim and Stastics Class"
date: "`r Sys.Date()`"
output: html_document
---

Here are the game logo codes you all submitted and their output.

##Kalim
```{r group1}
library(ggplot2)
angle <- pi*(3-sqrt(5))
points <- 500

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

p <- ggplot(df, aes(x*t, y*t))
q <- p + geom_point(size = 5, 
                    alpha = 0.8, 
                    shape = 5, 
                    color = "lightblue") + 
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank()
  )
q + geom_point(size = 3, 
               alpha = 0.8, 
               shape = 5, 
               color = "lightblue") + 
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank()
  )

```

##Abby Stella and Stefan
```{r group2}
library(ggplot2)
angle <- 2.0
points <- 1000

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Copy the plotting code from Task 7
p<- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=0.6, shape=8, color = "limegreen")+
  theme(legend.position="none",
        panel.background = element_rect(fill="lightpink"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank())
```

##Aiden Theodore Henry
```{r group3}
library(ggplot2)
angle <- 13*pi/180
points <- 900

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Adjust the plot parameters to create the magenta flower
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(size = 7, alpha = 0.2, shape = 16, color = "violetred2")+
  theme(legend.position="none",
        panel.background = element_rect(fill = "black"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank())
```

##Carter Rohan and Nick
```{r group4}
library(ggplot2)
angle <- 13*pi/180
points <- 500

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Adjust the plot parameters to create the magenta flower
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(size=50, alpha=0.31, shape = 13, color="purple")+ 
  theme(legend.position = "none",
        panel.background = element_rect(fill="black"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank())
```

##Rex Noah and Hart
#```{r group5}
#
#```

##Ian Molly and Ethan
```{r group6}

library(ggplot2)
library(dplyr)
library(geomtextpath)


# Define the number of points
points <- 2000

# Define the angle
angle <- pi/2 + 0.001

# Spiral dataset
t <- (1:points) * angle
x_spiral <- cos(t)
y_spiral <- sin(t)

# Half-circle top dataset
r <- 750
x_temp <- seq(-r, r)
x_circle <- x_temp * 1.25 # stretch x values
y_circle <- sqrt(r^2 - x_temp^2) - 200

# Half-circle bottom
y_circle_b <- -sqrt(r^2 - x_temp^2) + 200

# Eye parabola top section dataset
x_temp <- -18:18
x_par <- x_temp * 35 # stretch x values
y_par <- -x_temp^2 + 324

# Bottom of eye parabola
y_par_b <- x_temp^2 - 324

# Create dataframes
spiral <- data.frame(t, x_spiral, y_spiral)
circle <- data.frame(x_circle, y_circle, y_circle_b)
eye <- data.frame(x_par, y_par, y_par_b)


# Object containing plot theme settings to remove axes, labels, etc.
remove_axes <- theme(panel.background = element_rect(fill='white'),
                     panel.grid = element_blank(),
                     axis.ticks = element_blank(),
                     axis.title = element_blank(),
                     axis.text = element_blank())


# Make the plot with ggplot2
plt <- ggplot() +
  # Remove axes, labels, etc.
  remove_axes + 
  
  # Points layer 1 using spiral dataframe
  geom_point(data = spiral, aes(x_spiral*t, y_spiral*t), 
             size = 80, alpha = 0.1, shape = 1, color = "#1c51ff") + 
  
  # Eye parabola top layer
  geom_path(data = eye, aes(x_par, y_par),
            linewidth = 2) + 
  # Eye parabola bottom layer
  geom_path(data = eye, aes(x_par, y_par_b),
            linewidth = 2) +
  
  # Eye center
  geom_point(aes(0, 0), size=15) +
  
  # Upper curved text layer using half-circle dataframe
  geom_textpath(data = circle, aes(x_circle, y_circle), 
                size = 6, label = "S E C O N D", 
                text_only = TRUE, fontface = "bold") +
  # Lower curved text
  geom_textpath(data = circle, aes(x_circle, y_circle_b), 
                size = 6, label = "S I G H T", 
                text_only = TRUE, fontface = "bold")



# Make plot with message to check console
warning_message <- ggplot() +
  # First text
  geom_textpath(aes(0, 2), size = 20, 
                label = "IMAGE\n SAVED!", color="#026302",
                text_only = TRUE, fontface = "bold") +
  
  # Second text
  geom_textpath(aes(0, -1), size = 10, 
                label = "SEE CONSOLE FOR\nSAVED IMAGE PATH", color="#011b92",
                text_only = TRUE, fontface = "bold") +
  
  # Third text
  geom_textpath(aes(0, -3), size = 7, 
                label = "This was done to ensure\nproper image generation.", color="darkred",
                text_only = TRUE, fontface = "bold") +
  
  # Fix boundaries with points
  geom_point(aes(0,5), alpha=0) + geom_point(aes(0,-5), alpha=0)

# Save high-resolution image
cat("\nSaving image file...\n\n")

ggsave("second_sight.png", plot = plt, dpi = 500, width = 7 , height = 7) # Deal with this

# Show message
warning_message

cat(paste("\nHigh-resolution, correct logo image saved to: '", getwd(), "/second_sight.png'", sep = ""))

```

```r
#Link to the photo in Kalim's Google Drive:
https://drive.google.com/file/d/1kdsw34UkLYcTQh0CC6xJT_R9r8yXbhDb/view?usp=share_link
```


```{r kalim2}
library(tidyverse)
library(plotly)
t <- seq(0, 2*pi, length.out = 50)
x <- cos(t)
y <- sin(t)
df <- data.frame(t, x, y)
plot_ly(
  data = df,
  x = x*t,
  y = y*t,
  type = "scatter",
  mode = "markers"
)

```

