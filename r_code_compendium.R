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
