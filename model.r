
require(pmml) 
data <- read.table("/home/malintha/Documents/Research/pmml/data.csv",sep=",", header=TRUE)
names <- c ("pickUp","dropOff","day","hour","cost")
colnames(data) <- names
indexes <- sample(1:nrow(data), size=0.2*nrow(data))
test <- data[indexes,]
train <- data[-indexes,]
features <- c("pickUp","dropOff","day","hour","cost")
data

model <- lm(formula =  cost~ pickUp+dropOff+day+hour, data = train)
summary(model)
p <- predict.lm(model, test, se.fit=TRUE )
pred.w.plim <- predict( model, test, interval="prediction")
pred.w.clim <- predict( model, test, interval="confidence")

prediction <- data.frame(actual = test$cost , predicted = p$fit, error = test$cost - p$fit )
taxi_model <- pmml(model)
save_pmml(taxi_model,"/home/malintha/Documents/Research/pmml/model.pmml")

