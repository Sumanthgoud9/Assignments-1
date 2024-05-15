#read a csv file
stats <-read.csv(file.chosen())
stats

#Show the data France
stats[stats$Country.Name =="France",]

#show the countries with birthrate >20 and high income
data<- stats[stats$birth.rate >20 & stats$Income.Group =="High income",]
print(data)

#.Show the data of the country with the highest internet users.
max_internet_users_country <-stats[stats$Internet.users == max(stats$Internet.users,
                                                               na.rm = TRUE),]
print(max_internet_users_country)

#Average birthRate
Avg_birthrate <- mean(stats$Birth.rate, na.rm = TRUE)
print(Avg_birthrate)

#Standard Deviation of birthrate
SD_birthrate <- sd(stats$Birth.rate, na.rm =TRUE)
print(SD_birthrate)


#Countries whose birth rate is two SDs above the mean
Countries_above_2SDs <-stats[stats$Birth.rate > (Avg_birthrate + 2*SD_birthrate),]

#Print the filtered data frame
Countries_above_2SDs

#IQR of the birthrate
Iqr_birthrate <- IQR(stats$Birth.rate, na.rm = TRUE)
print(Iqr_birthrate)

