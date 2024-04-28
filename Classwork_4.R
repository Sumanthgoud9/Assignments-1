# Example of matrix 
First <- rnorm(50)
Second <- First +  rnorm(50, mean=0, sd=0.4)
data <- as.data.frame(cbind(First,Second))
summary(data)
library(ggplot2)
# visualization
ggplot( data, aes(x=First,y=Second)) + geom_point(size=2)

# Basic function on matrix
data("anscombe")
anscombe
levels <- gl(4, nrow(anscombe))
mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4),
                                   mygroup=levels))
mydata
theme_set(theme_bw())
ggplot(mydata, aes(x,y)) + geom_point(size=4)  + 
  geom_smooth(method="lm", fill=NA, fullrange=TRUE)   + facet_wrap(~mygroup)

# Missing data in R
x <- c( 1,2,3,NA,5)
x
is.na(x)
mean(x)   
mean(x, na.rm=TRUE)  
DF <- data.frame( x= c(12,9,23), y=c(10,20,NA))
DF
DF1 <- na.exclude(DF)
DF1
max(DF)  
max(DF, na.rm=TRUE) 
max(DF1) 

#Dot Chat and Bar Plot
data(mtcars)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.6,
         main="Miles per Gallons of Car models", xlab="mpg")
barplot(table(mtcars$cyl), main="Dist of Car Cylinder Count", 
        xlab="Number of cylinders")

# Stem and leaf VS Histogram
x <- c( 12, 13, 21, 27, 33, 34, 35, 37, 46, 51, 51, 57)
x
stem(x)
hist(x)

#Histogram And Density Plot
income <- 1000 * rlnorm(4000, meanlog = 4, sdlog = 0.7)
summary(income) 
hist( income, breaks=500, xlab="Income", main = "Histogram of Income")
rug(income)
plot(density(log10(income),adjust=0.5), main="Log10 Scale Distribution")
rug(log10(income))

#Nicer Density plot 
library("ggplot2")
data(diamonds)
nicediamonds <- diamonds [diamonds$cut=="Premium" | diamonds$cut=="Ideal",]
summary(nicediamonds$cut)

#Showing Three variables
data("mtcars")
cars <- mtcars[order(mtcars$mpg),]
cars$cyl <- factor(cars$cyl)
cars$color[cars$cyl==4] <- "Red"
cars$color[cars$cyl==6] <- "Blue"
cars$color[cars$cyl==8] <- "Green"
dotchart(cars$mpg, labels=row.names(cars), cex=.7,
         groups=cars$cyl, main="Miles per Gallon", 
         xlab="Miles oer Gallon", color= cars$color, gcolor="Black")


# Creating a different type of matrix 
A<- matrix(1:10, nrow=5)
A
B <- matrix( 21:40, nrow=2)
B
C <- matrix(1:100,  20)
C
D <- matrix(0,4,4)
D
E <- matrix(0,10)
E
F <- matrix(c(4,5,6,2,3,4,12,34,45,10,55,32),4,3)
F

# Matrix by Snaking
Data <- 1:20
A <-matrix(Data, 4,5)            
A
B <-matrix(Data,4,5,byrow=TRUE) 
B
C<-A+B
C

# Binding Matrix and vector
r1 <- c("I", "am","happy")
r2 <- c ("what", "a", "day")
r3 <-1:3
C <- rbind(r1,r2,r3)
C
D <-cbind(r1,r2,r3)      
D

# Matrix Function
A <- matrix(1:10, nrow=5)
A
nrow(A)
ncol(A)
dim(A)
typeof(A)
B <- t(A)
B

#Matrix Acess
A <- matrix(1:10, nrow=5)
A
A[1,1]
A[,1]
A[1,]
A[-2,]
A[,-2]
A[-2,-2]

#Named Vector
Charlie <- 7:11
Charlie
names(Charlie) <- c("a", "b","c","d","e")
Charlie
Charlie[4]
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

# Named Matrix
temp <- rep(c("a", "b","c"),each=3)
temp
Bravo <- matrix(temp,3,3)
Bravo
rownames(Bravo) <- c("Tom", "Dick", "Harry")
Bravo
colnames(Bravo) <- c("Alice", "Jane", "Mary")
Bravo

# Another Example of Named Matrix
Bravo[2,3] <-0
Bravo
Bravo["Tom", "Mary"] <- 0
Bravo
rownames(Bravo)
colnames(Bravo)

# simple math of basket ball 
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]
FieldGoals
round( FieldGoals / Games, 2)
round (MinutesPlayed / Games)
round(Salary/Games)
round(Salary/FieldGoals)
# can also do + - * > < ==

# subsetting in a vector
x <-c("a","b","c","d","e")
x
x[c(1,4)]        
x[1]               


# Sub-setting in a Matrix
Games
Games[1:3, 6:10]   
Games[c(1,10), ]   
Games[ , c("2008","2009")]
Games[1,]                 
Games[1,5]               
is.matrix(Games[1,])
is.vector(Games[1,])


Games[1, , drop=F]       
is.matrix(Games[1, , drop=F])
is.vector(Games[1, , drop=F])
Games[1,5, drop=F]


# plots COLUMNS against each other
?matplot
FieldGoals
t(FieldGoals)  
matplot(FieldGoals) 
matplot(t(FieldGoals)) 

# Let's check out the parameters,  but ggplot is much better
matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, 
       legend=Players,pch=15:18, col=c(1:4,6), horiz=FALSE)
matplot(t(FieldGoals/FieldGoalAttempts), 
        type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, 
       legend=Players,pch=15:18, col=c(1:4,6), horiz=FALSE)

#Dwight Howard has the best performance!!!


#Basic math Function Example of plotting
myplot <-function(rows){
  Data <- MinutesPlayed[rows, ,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, 
         legend=Players[rows],pch=15:18, col=c(1:4,6), horiz=FALSE)
}
myplot(3:5)
myplot(7)
myplot(c(1,7))

myplot2 <-function(mat,rows=1:10){  # default is 1:10
  Data <- mat[rows, ,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, 
         legend=Players[rows],pch=15:18, col=c(1:4,6), horiz=FALSE)
}
myplot2(Points,1:10)
myplot2(Salary,1:3) 
myplot2(Salary)
myplot2(MinutesPlayed/Games, 3:5) 


#salary
myplot2(Salary)
myplot2(Salary/Games)
myplot2(Salary/FieldGoals)
myplot2(MinutesPlayed)
myplot2(Points)
myplot2(FieldGoals/Games)
myplot2(FieldGoals/FieldGoalAttempts)
myplot2(FieldGoalAttempts/Games)  
myplot2(Points/Games) 
myplot2(MinutesPlayed/Games)  
myplot2(Games)  