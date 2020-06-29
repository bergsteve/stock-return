tab1 = read.csv("1957_1967.csv")
tab1 = tab1[,c(1, 2, 3, 10)]

tab2 = read.csv("1968_1978.csv")
tab2 = tab2[,c(1, 2, 3, 10)]

tab3 = read.csv("1979_1989.csv")
tab3 = tab3[,c(1, 2, 3, 10)]

tab4 = read.csv("1990_2000.csv")
tab4 = tab4[,c(1, 2, 3, 10)]

tab5 = read.csv("2001_2011.csv")
tab5 = tab5[,c(1, 2, 3, 10)]

tab6 = read.csv("2012_2016.csv")
tab6 = tab6[,c(1, 2, 3, 10)]

X = rbind(tab1, tab2, tab3, tab4, tab5, tab6)
attach(X)
Y = X[order(permno),]
library(dplyr)
Y = Y%>% mutate(return = lead(mom1m))
Y = Y[,-4]
Y = na.omit(Y)

Y = Y %>% group_by(DATE) %>% mutate(agg.size = sum(mvel1)) %>% mutate(weight = mvel1/agg.size) %>% group_by(DATE) %>% mutate(s = sum(weight)) %>% group_by(DATE) %>% mutate(sum(weight*return))

newdf = Y %>% filter(DATE == "19570329")
Y = Y[, c(2,8)]
Y = distinct(Y)

colnames(Y) = c("date", "return")

a = seq(1, dim(Y)[1], by = 1)
Y$index = a
attach(Y)
plot(index, return, type = "l")
write.csv(Y, "data_complete.csv")


r=Y$return
print(43.26*prod(1+r), digits = 9)

> 