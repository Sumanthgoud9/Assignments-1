# Vectors
N <-100000
a <-rnorm(N)
b <- rnorm(N)

#Vectorized approach
c <- a * b
c

# Vectors using mean median standard devation
X <- rnorm(5)
X <- rnorm( 5, 10, 1)
X <- rnorm (5, 10)
X <- rnorm(5, mean=10, sd = 1)
X <- rnorm(5, sd=1, mean=10) 
X <- rnorm(5, sd=1)

# print boxplot ,hist ,plotbox 
x <-rnorm(10)
#plot(x)
#hist(x)
boxplot(x,horizontal = TRUE)

# Vectors using mean median standard devation
X <- rnorm(5)
X
X <- rnorm( 5, 10, 1)
X
X <- rnorm (5, 10)
X
X <- rnorm(5, mean=10, sd = 2)
X
X <- rnorm(5, sd=3, mean=10)
X
X <- rnorm(5, sd=4)
X

# Examples 
x <-rnorm(5,10,2)
plot(x)
hist(x)
boxplot(x,horizontal = TRUE)

x <-rnorm(5,10,1)
plot(x)
hist(x)
boxplot(x,horizontal = TRUE)

# Generate the vector of numbers 
x <-rnorm(100000)
# count how many are between -1 and 1
count <- 0
for (i in x)
  if (i>-1 & i<1)
    count <- count+1
# Get and print the percentage, should be around 68%
percent <- count/length(x)
percent

x <-rnorm(80000)
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x, horizontal = TRUE)