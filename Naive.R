str(iris)
head(iris, 10)

set.seed(42)
sample_split <- sample.split(Y = iris$Species, SplitRatio = 0.75)
train_set <-subset(x=iris, sample_split==TRUE)
test_set <-subset(x=iris, sample_split==FALSE)

sample1 <- sample.split(iris, SplitRatio = 0.7)
train1 <-subset(iris, sample1==TRUE)
test1 <- subset(iris, sample1==FALSE)

train_s <- scale(train1[,1:4])
test_s <- scale(test1[,1:4])

naive1<- naiveBayes(Species ~., data=train1)
naive1

pred3 <- predict(naive1, newdata=test1)

table3 <- table(test1$Species, pred3)

confusionMatrix(table3)
