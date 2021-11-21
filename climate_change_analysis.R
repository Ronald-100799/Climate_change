library(ggplot2)
library(dplyr) 



## reading the data
climate_change <- read.csv("D:/datasets/Time Series/climate_change.csv")
View(climate_change)
## checkung the names of each column
names(climate_change)
## attching the column names for further convenience
attach(climate_change)
## descriptive stats of each column
summary(climate_change)
str(climate_change)
## checking the shape of the data
dim(climate_change)

# Missing value of all the column
sapply(climate_change, function(x) sum(is.na(x)))

# 1.checking through which years is the data recorded
min(Year)
max(Year)
# 2.checking the unique values in the "Year" column gives an idea of whether some year data has been missed
unique(Year)
# 3.checking the distribution of each variable with respect to year
## CO2 levels 
ggplot(climate_change, aes(Year,CO2)) + 
  geom_line() + 
  geom_point()
## CH4 levels
ggplot(climate_change, aes(Year,CH4)) + 
  geom_line() + 
  geom_point()
## N2O levels
ggplot(climate_change, aes(Year,N2O)) + 
  geom_line() + 
  geom_point()
# CFC.11 level
ggplot(climate_change, aes(Year,CFC.11)) + 
  geom_line() + 
  geom_point()
# CFC.12 level
ggplot(climate_change, aes(Year,CFC.12)) + 
  geom_line() + 
  geom_point()
## TSI level
ggplot(climate_change, aes(Year,TSI)) + 
  geom_line() + 
  geom_point()
# MEI level
ggplot(climate_change, aes(Year,MEI)) + 
  #geom_line() + 
  stat_smooth(aes(y=MEI, x=Year), method = lm, formula = y ~ poly(x, 10), se = FALSE,color='green') 
##  Aerosols level
ggplot(climate_change, aes(Year,Aerosols)) + 
  #geom_line() + 
  stat_smooth(aes(y=Aerosols, x=Year), method = lm, formula = y ~ poly(x, 10), se = FALSE,color='purple')
## Temp level
ggplot(climate_change, aes(Year,Temp)) + 
  #geom_line() + 
  stat_smooth(aes(y=Temp, x=Year), method = lm, formula = y ~ poly(x, 10), se = FALSE,color='red')

## 4.checking correlation between each variable:
cor(climate_change)


    