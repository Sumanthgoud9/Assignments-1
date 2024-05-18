# Load necessary libraries
library(dplyr)
library(ggplot2)
# Linear Regression
# Create the data frame
car_data <- read.csv(file.choose())
# Convert 'Condition' to a factor
car_data$Condition <- factor(car_data$Condition)
linear_model <- lm(Price ~ Mileage + Year + Make + Model + Condition, data = car_data)
# Predict the prices using the linear model
car_data$PredictedPriceLinear <- predict(linear_model, car_data)
# Plot actual vs. predicted prices for linear regression
ggplot(car_data, aes(x = Price, y = PredictedPriceLinear)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, color = "brown") +
  labs(title = "Actual vs. Predicted Prices (Linear Regression)",
       x = "Actual Price",
       y = "Predicted Price") +
  theme_minimal()

#Polinominal Regression
# Create a data frame for prediction
car_data <- read.csv(file.choose())
predict_data <- data.frame(Mileage = mileage_seq)
# Predict prices for the sequence of mileage values
predict_data$PredictedPrice <- predict(poly_model, newdata = predict_data)
# Plot the data and the polynomial curve
ggplot(car_data, aes(x = Mileage, y = Price)) +
  geom_point() +
  geom_line(data = predict_data, aes(x = Mileage, y = PredictedPrice), color = "green", size = 1) +
  labs(title = "Polynomial Regression: Mileage vs. Price",
       x = "Mileage",
       y = "Price") +
  theme_minimal()

# Logistic Regression
car_data <- read.csv(file.choose())
# Predict the probabilities using the logistic model
car_data$PredictedProbLogistic <- predict(logistic_model, car_data, type = "response")
# Plot actual vs. predicted probabilities
ggplot(car_data, aes(x = Price, y = PredictedProbLogistic)) +
  geom_point() +
  geom_hline(yintercept = 0.5, color = "purple") +
  labs(title = "Price vs. Predicted Probability (Logistic Regression)",
       x = "Price",
       y = "Predicted Probability > $20,000") +
  theme_minimal()
