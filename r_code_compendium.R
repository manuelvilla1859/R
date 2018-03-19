help(merge)
?merge
??merge
example(merge)

getwd()

rm(list = ls()) # WARNING! Removes all objects!

# Environments ====================================================================================
x <- 'This x variable exist in the global environment'
env1 <- new.env()
env1$x <- 'This x variable exist in the environment env1'

x
env1$x
# equivalently:
get('x')
get('x', env1)


ls() # this is the list of objects in the global environment
ls(env1) # this is the list of objects in environment env1
parent.env(env1)

ls(all.names = TRUE)
ls(env1, all.names = TRUE)

ls.str()
ls.str(env1)

install.packages('pryr')
library(pryr)
where('x')
where('mean')

globalenv()
baseenv()
emptyenv()

environment()

as.environment(globalenv())

search()




x <- list(list(1, 2), c(3, 4))
y <- c(list(1, 2), c(3, 4))

str(x)
str(y)
c(1L, FALSE)

# Attributes ====================================================

attr() # Accesses attibutes individually
attributes() # Accesses attibutes all at once (as a list)
structure(1:10, my_attribute = "This is a vector")

# Factors ====================================================

v <- c("a", "b", "b", "c", "a", "c", "c")
f <- factor(c("a", "b", "b", "c", "a", "c", "c"))
v
f

class(v)
class(f)
levels(v)
levels(f)

vf <- factor(v)
vf
vf <- factor(v, levels = c('a', 'b'))
vf
vf <- factor(v, levels = c('a', 'b', 'c', 'd'))
vf
table(vf)



# Two scalar arguments to specify rows and columns
m <- matrix(1:6, ncol = 3, nrow = 2)
# One vector argument to describe all dimensions
a <- array(1:12, c(2, 3, 2))
# You can also modify an object in place by setting dim()
v <- 1:6
dim(v) <- c(3, 2)

v
a
m
class(v)
class(a)
class(m)

# Beware data.frame()’s default behaviour which turns strings into factors.
# Use stringsAsFactors = FALSE to suppress this behaviour: 


# Data Frame =================================================

# A data frame is a LIST! A particular one: a list of equal-length vectors
df <- data.frame(x = 1:3, y = c("a", "b", "c"))
typeof(df)
df
str(df)

df <- data.frame(x = 1:3, y = c("a", "b", "c"), stringsAsFactors = F)
df
str(df)



mtcars
is.vector(mtcars)

mtcars[2]
is.vector(mtcars[2])

mtcars[[2]]
is.vector(mtcars[[2]])

mtcars[["cyl"]]
is.vector(mtcars[["cyl"]])


# Subsetting ===================================================

# 1. Atomic vectors & lists
v <- c(2.1, 4.2, 3.3, 5.4)
v[2] # returns the second value of the list
v[[2]] # ibid.
v[c(2)] # ibid.
v[c(3, 1)]
v[-c(3, 1)]
v[v > 3]
v[c(T, F, T, T)]
v[c(T, F)]
v[c(T, NA)]
v[]
v
v[0]
v[1,3] # Error; have to evpress the subsetting elements as a vector


# 2. Lists
# Subsetting a list works in the same way as subsetting an atomic vector.
# Using [ will always return a list; [[ and $ extract components of the list. 
l <- list(2.1, 4.2, 3.3, 5.4)
l[1] # list (consisting of only one value)
l[[1]] # value

l <- setNames(l, letters[1:4])
l['a'] # list (consisting of only one value)
l[['a']] # value
l$a #value

# 3. Matrices & arrays
m <- matrix(11:19, nrow = 3)
colnames(m) <- c('A', 'B', 'C')

m[2] # value
m[[2]] # value
m[2,] # value (it returns row 2, but it is actually of type 'named integer')

m[]
m[c(1,2), c('B', 'C')]
m[c(1,2), c(2, 3)]
m[3, 2] # value
m[6] # think why this gives the same value as above
m[c(1,3), ]
m[ ]
m[0]
m[0, ]
m[, 0]
m[m$A == 2, ] # Error. This can only be done with data frames; that is, you cannot filter by values!





# 3. Data frames
df <- data.frame(x = 1:3, y = 9:7, z = letters[1:3])

df[1] # data frame (returns column 1; not value # 1)
df[,1] # vector

df[2,1] # integer (returns the value in position (1,2))
df[c(2,1)] # data frame (returns columns 1 & 2)
df[c(2,1), c('y', 'x')] # data frame
df[c(1,2), c(2, 3)] # ibid
df[c(1,3), ] # ibid
df[] # ibid
df # ibid
df[df$x == 2, ] # ibid (This canot be used with arrays)

# subsetting like a list
df[2,3] # value
df[c(2, 3)]  # cols 2 & 3 (if there is no comma, it will assume the vector refers to columns)
df[c('y', 'z')] # ibid
# subsetting like a matrix
df[, c(2, 3)]
df[, c('y', 'z')]
df[c(2, 3), ]
df[c('y', 'z'), ]

df[2,2] <- NA
df[is.na(df)] <- 0
df



# There’s one important difference between $ and [[. $ does partial matching:
x <- list(abc = 1)
x$a
x[["a"]]




n <- 10
sample(n, 4, replace = F)


# Data frame - Sorting ====================================
df <- data.frame(x = rep(1:3, each = 2), z = letters[1:6], y = 6:1)
df

df[order(df$y, decreasing = F), ]
df[, order(names(df))]






x <- sample(10) < 4
which(x)

x <- 1:10 %% 2 == 0
y <- 1:10 %% 5 == 0
which(x & y)
which(x | y)
which(x & !y)
which(!x & y)
which(!x & !y)
which(!(x | y))


library('datasets')
library(help='datasets')


# The paste function =======================================
paste("a", "b")  # "a b"
paste0("a", "b")  # concatenate without space, "ab"
paste("a", "b", sep="")  # same as paste0
paste(c(1:4), c(5:8), sep="")  # "15" "26" "37" "48"
paste(c(1:4), c(5:8), sep="", collapse="")  # "15263748"
paste0(c("var"), c(1:5))  # "var1" "var2" "var3" "var4" "var5"
paste0(c("var", "pred"), c(1:3))  # "var1" "pred2" "var3"
paste0(c("var", "pred"), rep(1:3, each=2))  # "var1" "pred1" "var2" "pred2" "var3" "pred3


table(airquality$Month[c(1:60)]) 
table(airquality$Temp[c(1:60)]) 
table(airquality$Month[c(1:60)], airquality$Temp[c(1:60)]) 


# Plotting - ggplot2 ==================================================================

# browseURL('http://r-statistics.co/ggplot2-Tutorial-With-R.html')

str(diamonds)

ggplot(diamonds, aes(x=carat, y=price)) +
  labs(title = 'Diamonds, diamonds, diamonds...', x = 'Carat', y = 'Price') +
  theme(plot.title = element_text(size = 30, face = 'bold'),
        axis.title.x = element_text(size = 20),
        axis.title.y = element_text(size = 20),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15)) +
  scale_colour_discrete(name = 'Diamond colour') +
  scale_shape_discrete(name = 'Diamond cut') +
  geom_point(aes(color=color, shape=cut)) +
  geom_smooth() +
  # facet_wrap(color ~ cut, ncol = 5) #, scales = 'free')
  facet_grid(color ~ cut) # OJO: facet_grid makes all plots have the same scale, so only appropriate for series that are not too far from each other.

# time series
data(economics, package = 'ggplot2') # this simply initiates the data set called 'economics' which is included as an example in the ggplot2 package

econ <- data.frame(economics) # economics is not originally a data frame
econ

# Approach 1
ggplot(econ) + 
  geom_line(aes(x=date, y=pce, color="pcs")) + 
  geom_line(aes(x=date, y=unemploy, col="unemploy")) + 
  scale_color_discrete(name="Legend") + 
  labs(title="Economics")

# Approach 2
install.packages("reshape2")
library(reshape2)

df <- melt(economics[, c("date", "pce", "unemploy")], id="date")
ggplot(df) +
  geom_line(aes(x=date, y=value, color=variable)) + 
  labs(title="Economics")

df <- melt(economics[, c("date", "pce", "unemploy", "psavert")], id="date")
ggplot(df) + 
  geom_line(aes(x=date, y=value, color=variable))  + 
  facet_wrap( ~ variable, scales="free") 


# bar charts
plot1 <- ggplot(mtcars, aes(x = cyl)) +
           geom_bar()
print(plot1)

df <- data.frame(var=c("a", "b", "c"), nums=c(1:3))
plot2 <- ggplot(df, aes(x = var, y = nums)) +
           geom_bar(stat = 'identity')
plot2

# displaying multiple ggplots in a single grid
library(gridExtra)
grid.arrange(plot1, plot2, ncol = 2)

# flipping coordinates
plot1 + coord_flip()



# themes
install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)

ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  geom_smooth(aes()) +
  # theme_wsj() +
  # theme_fivethirtyeight() +
  theme_economist() +
  scale_colour_economist()





# Adjust X and Y axis limits

#  1- Using coord_cartesian(xlim=c(x1,x2))
#  2- Using xlim(c(x1,x2))
# Warning: Item 2 will delete the datapoints that lie outisde the limit from the data itself.
# So, if you add any smoothing line line and such, the outcome will be distorted. 
# Item 1 does not delete any datapoint, but instead zooms in to a specific region of the chart.

ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  geom_smooth(aes()) +
  # coord_cartesian(ylim = c(0, 10000)) +
  ylim(c(0,10000))




# Plotting - ggfortify ------------
# browseURL('http://rpubs.com/sinhrks/plot_ts')

install.packages('ggfortify')
library(ggfortify)

install.packages('zoo')
library(zoo)

str(AirPassengers)
autoplot(AirPassengers)

install.packages('vars')
library(vars)
data(Canada)
str(Canada)
autoplot(Canada)
autoplot(Canada$rw, linetype = 'dashed', colour = 'blue')# Use help(autoplot.ts) (or help(autoplot.*) for any other objects) to check available options.
autoplot(Canada, facets = F) # all lines in one single graph

autoplot(AirPassengers, geom = 'bar', fill = 'brown4')
autoplot(AirPassengers, geom = 'point', shape = 5)

