longley
data(longley)
str(longley)
cor(longley) #상관분석(pearson)
pairs(longley) #상관분석 시각화
cor(longley,method = "spearman") #상관분석(spearman)
library(psych)
pairs.panels(iris[,1:4]) #상관분석 그래프, 상관계수 값 시각화
pairs.panels(iris[,1:4],scale = T) #상관분석 그래프, 상관계수 값(크기에 조절) 시각화
cor.plot(cor(iris[,1:4]))
cor.plot(cor(iris[,1:4]),numbers = F) # 상관계수 값 제거
install.packages('corrplot')
library(corrplot)
corrplot(cor(iris[,1:4]))
corrplot(cor(iris[,1:4]),method = 'ellipse',type = 'lower') #하삼각행렬 시각화
corrplot(cor(iris[,1:4]),method = 'ellipse',type = 'upper') #상삼각행렬 시각화
corrplot.mixed(cor(iris[,1:4]))
corrplot.mixed(cor(iris[,1:4]),lower = "circle",upper = "number")