# Load necessary libraries
library(dplyr)
library(ggplot2)
# Predict the prices using the linear model
car_data$PredictedPriceLinear <- predict(linear_model, car_data)

# Plot actual vs. predicted prices
ggplot(car_data, aes(x = Price, y = PredictedPriceLinear)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  labs(title = "Actual vs. Predicted Prices (Linear Regression)",
       x = "Actual Price",
       y = "Predicted Price") +
  theme_minimal()

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Create the data frame
car_data <- data.frame(
  Make = c("Ford", "Toyota", "Chevrolet", "Ford", "Chevrolet", "Ford", "Toyota", "Chevrolet", "Ford", "Ford", "Toyota"),
  Model = c("Silverado", "Silverado", "Civic", "Civic", "Civic", "Silverado", "Altima", "Silverado", "Camry", "Altima", "Altima"),
  Year = c(2022, 2014, 2016, 2022, 2019, 2013, 2014, 2015, 2014, 2016, 2019),
  Mileage = c(18107, 13578, 46054, 34981, 63565, 23600, 11470, 89471, 121298, 110691, 112693),
  Condition = c("Excellent", "Excellent", "Good", "Excellent", "Excellent", "Excellent", "Excellent", "Good", "Good", "Excellent", "Excellent"),
  Price = c(19094.75, 27321.1, 23697.3, 18251.05, 19821.85, 27820.0, 27426.6, 22526.55, 21935.1, 20465.45, 17365.45)
)

# Convert 'Condition' to a factor
car_data$Condition <- factor(car_data$Condition)

# Polynomial Regression (Mileage vs Price)
poly_model <- lm(Price ~ poly(Mileage, 2), data = car_data)

# Create a sequence of mileage values for prediction
mileage_seq <- seq(min(car_data$Mileage), max(car_data$Mileage), length.out = 100)

# Create a data frame for prediction
predict_data <- data.frame(Mileage = mileage_seq)

# Predict prices for the sequence of mileage values
predict_data$PredictedPrice <- predict(poly_model, newdata = predict_data)

# Plot the data and the polynomial curve
ggplot(car_data, aes(x = Mileage, y = Price)) +
  geom_point() +
  geom_line(data = predict_data, aes(x = Mileage, y = PredictedPrice), color = "blue", size = 1) +
  labs(title = "Polynomial Regression: Mileage vs. Price",
       x = "Mileage",
       y = "Price") +
  theme_minimal()


# Predict the probabilities using the logistic model
car_data$PredictedProbLogistic <- predict(logistic_model, car_data, type = "response")

# Plot actual vs. predicted probabilities
ggplot(car_data, aes(x = Price, y = PredictedProbLogistic)) +
  geom_point() +
  geom_hline(yintercept = 0.5, color = "green") +
  labs(title = "Price vs. Predicted Probability (Logistic Regression)",
       x = "Price",
       y = "Predicted Probability > $20,000") +
  theme_minimal()


