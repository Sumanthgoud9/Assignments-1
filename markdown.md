library(ggplot2)

all <- read.csv(file.choose())
head(all)
qplot(data=all, x=population_share, y=tv_audience_share)
mat <- cbind( all$population_share, all$tv_audience_share)
head(mat)
kmeans(mat,centers=3)
km = kmeans(mat,centers=3)$cluster
all$cl <- factor( km)
head(all)
summary(all)

all <- read.csv(file.choose()) 
head(all)
qplot(data=all, y=population_share) # All over the place!!
kmeans(all$population_share,centers=3) # divide into 3 groups based on Internet Usage
# lets draw it
km = kmeans(all$population_share,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
qplot(data=all, y=population_share, color=gdp_weighted_share)
qplot(data=all, y=population_share, color=cl)
qplot(data=all, y=tv_audience_share) # All over the place!!
kmeans(all$tv_audience_share,centers=3) # divide into 3 groups based on Internet Usage
# lets draw it
km = kmeans(all$tv_audience_share,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
qplot(data=all, y=tv_audience_share, color=gdp_weighted_share)
qplot(data=all, y=tv_audience_share, color=cl)

all <- read.csv(file.choose()) 
head(all)
qplot(data=all, y=population_share)
qplot(data=all, y=tv_audience_share)
qplot(data=all, y=gdp_weighted_share)
mat <- cbind(all$population_share, all$tv_audience_share, all$gdp_weighted_share)
head(mat)
kmeans(mat,centers=3) # divide into 3 groups
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
# A bit hard to draw 4 columns
qplot(data=all, y=population_share, color=cl)
qplot(data=all, y=tv_audience_share, color=cl)
qplot(data=all, y=gdp_weighted_share, color=cl)
qplot(data=all, x=gdp_weighted_share,y=population_share, color=cl)
qplot(data=all, x=gdp_weighted_share,y=tv_audience_share, color=cl)
qplot(data=all, x=tv_audience_share, y=gdp_weighted_share, color=cl)

all <- read.csv(file.choose())
head(all)
install.packages("plot3D") # This is a cool library to draw 3D plots!
library("plot3D")
scatter3D(all$population_share,all$tv_audience_share,all$gdp_weighted_share)
mat <- cbind(all$population_share, all$tv_audience_share, all$gdp_weighted_share, col=NULL)
head(mat)
kmeans(mat,centers=3) # divide into 3 groups
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- km
scatter3D(all$population_share,all$tv_audience_share,all$gdp_weighted_share, colvar=all$cl)

all <- read.csv(file.choose())
head(all)
install.packages("plot3D")
library("plot3D")
scatter3D(all$population_share,all$tv_audience_share,all$gdp_weighted_share)
mat <- cbind(all$population_share, all$tv_audience_share, all$gdp_weighted_share, col=NULL)
head(mat)
wss <- rep(0,15) # remember this!
wss
for (k in 1:15)
  wss[k] <- sum( kmeans(mat,centers=k, nstart=50)$withinss)
wss
plot(wss, type="b") # see the ELBOW at index = 3, so 3 clusters is best
kmeans(mat,centers=3) # divide into 3 groups
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- km
scatter3D(all$population_share,all$tv_audience_share,all$gdp_weighted_share, colvar=all$cl)

