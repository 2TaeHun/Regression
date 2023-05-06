cars
plot(cars$speed,cars$dist)
#선형회귀(Liner Regression)
x<-c(160,165,170,175,180,185,190)
y<-c(172,174,168,181,177,183,184)
cm<-data.frame(x,y)
cm
lm_cm<-lm(cm$y~cm$x) #선형회귀(단순)
lm_cm
plot(cm$x,cm$y) #산점도
abline(lm_cm,col="blue") #최소 오차 회귀직선
pred_cm<-predict(lm_cm) #선형회귀 예측값(x)
pred_cm (98.25+0.45*x(아들키)=y_hat)
summary(lm_cm)
anova(lm_cm) #ANOVA 분산분석
