library(missForest) #관측된 변수가 충분한 정보를 제공하는 경우 성능이 뛰어나다.
set.seed(100)
iris
dim(iris)
str(iris)
md<-prodNA(iris,noNA = 0.1) #임의로 10% 결측치 생성
table(is.na(md)) #iris데이터에서 10%결측치 테이블함수로 확인
head(md)
library(mice) #많이 사용되는 방법
md.pattern(md) #결측값 패턴을 테이블/시각화로 보여줌
library(VIM)
plor_md<-aggr(md,col=c('blue','red'),numbers=T,sortVars=T,labels=names(md),cex.axis=0.7,prop=F,gap=3,ylab=c("Missing Data","Pattern"))
#결측치를 각각의 변수를 결측빈도를 막대그래프, 패턴으로 나타냄
md_1<-mice(md,m=5,maxit = 50,method = 'pmm',seed=500) #다중 대치 지정 PMM방법(연속형/이산형)
md_1
imputed_0<-complete(md_1,0) #md(결측치가 있는 원 데이터)
imputed_1<-complete(md_1,1) #결측값 대치 후의 자료 출력(5개 중 n번째 사용) 
imputed_2<-complete(md_1,2)
imputed_3<-complete(md_1,3)
imputed_4<-complete(md_1,4)
imputed_5<-complete(md_1,5)
summary(md_1)
md_2<-missForest(md)
names(md_2)
md_2$OOBerror 
#정규화된 평균제곱오차(연속적인 값의 대치로부터 유도되는 오차)-약13% / 범주형 값의 대치로부터 유도되는 오차-약7%
err<-mixError(md_2$ximp,md,iris) #실제 자료와의 비교
err
library(Hmisc) #일차적인 선택 방법
md_mean<-with(md,impute(Sepal.Length,mean)) #결측값 대치(중앙값, 평균값, 랜덤...)
md_median<-with(md,impute(Sepal.Length,median))
md_random<-with(md,impute(Sepal.Length,'random'))
md_min<-with(md,impute(Sepal.Length,min))
md_max<-with(md,impute(Sepal.Length,max))
library(mi)
md_4<-mi(md,seed=200)
summary(md_4)
