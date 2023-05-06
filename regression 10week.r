cars
str(cars)
dim(cars)
cor(cars)
pairs(cars)
plot(cars$speed,cars$dist)
lm_cars<-lm(cars$dist~cars$speed)
lm_cars
abline(lm_cars,col='blue')
pred<-predict(lm_cars)
pred
pred_conf<-predict(lm_cars,newdata =data.frame(speed=20),interval = "confidence",level = 0.9)
pred_conf #오차항 미포함
pred_pred<-predict(lm_cars,newdata=data.frame(speed=20),interval = "prediction",level = 0.9)
pred_pred #오차항 포함
#####예제
install.packages('faraway')
library(faraway)
stat500
cor(stat500$midterm,stat500$final)
plot(stat500$midterm,stat500$final)
lm_stat<-lm(stat500$final~stat500$midterm)
abline(lm_stat,col='red')
predict(lm_stat,newdata = data.frame(midterm=23),interval = 'confidence',level = 0.95)
predict(lm_stat,newdata = data.frame(midterm=23),interval = 'prediction',level = 0.95)
