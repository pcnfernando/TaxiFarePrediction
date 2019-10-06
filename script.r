cities <- c("Arbat","Basmanny","Meschansky","Presnensky","Tverskoy","Zamoskvorechye","Yakimanka")
days <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
hours <- c(1:24)
pickUp <- sample(cities,50,replace=TRUE)
dropOff <- sample(cities,50,replace=TRUE)
day <- sample(days,50,replace=TRUE)
hour <-  sample(hours,50,replace=TRUE )

facdays<- c(5,2,2,2,5,1,1)
faccities <- c(1,2,3,4,5,6,7)
fachours <- c(1,1,1,1,1,5,8,10,3,3,3,7,5,3,5,9,10,10,8,7,5,3,3,3)
names(faccities) <- cities
names(facdays) <- days
names(fachours) <- hours
names <- c("pickUp","dropOff","day","hour","cost")

pickupFac <- factor(pickUp)
dropOffFac <- factor(dropOff)
dayFac <- factor(day)
hourFac <- factor(hour)
  
load <- c(2,2,4,4)
cost <- c()
calCost <- function(Pickup,Dropoff,Day,Hour) {
   tempcost <- load[1] * faccities[Pickup] +load[2] * faccities[Dropoff] + load[3] * facdays[Day] + load[4] * fachours[Hour] + 100
   cost <<- c(cost,tempcost)
}
for (i in 1:50)
{
  print(i)
  calCost(pickUp[i],dropOff[i],day[i],hour[i])
}
df <- data.frame(pickUp,dropOff,day,hour,cost)
names(df)<- names
write.csv(df,"/home/malintha/Documents/Research/pmml/data.csv", row.names = FALSE)

