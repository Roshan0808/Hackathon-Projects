setwd('F:/Analytics/R/Project/Part 2/House Pricing')
getwd()

#Data Extraction
House_Orig<-read.csv('Regression-Analysis-House Pricing.csv')
View(House_Orig)
str(House_Orig)

# Changing the order of Parking factor
House_Orig$Parking<-factor(House_Orig$Parking,levels(House_Orig$Parking) [c(2, 3, 4, 1)])
# Changing the order of of City_Category
House_Orig$City_Category<-factor(House_Orig$City_Category, levels(House_Orig$City_Category) [c(3,2,1)])
# Changing Parking Factors from c(Covered, No Parking, Not Provided, Open)=c(1, 2, 3, 4)
# Chainging City_Category from c(CAT A, CAT B, CAT C)=c(1, 2, 3)

House_Orig$Parking<-as.numeric(House_Orig$Parking)
House_Orig$City_Category<-as.numeric(House_Orig$City_Category)


# Data Cleaning
House_Orig<-House_Orig[,-1]

sapply(House_Orig, function(x) sum(is.na(x)))

# Dist_Taxi   Dist_Market Dist_Hospital        Carpet       Builtup       Parking 
#     13            13             1             8            15             0 
# City_Category      Rainfall   House_Price 
#       0             0             0 

House_Orig$Dist_Taxi[House_Orig$Dist_Taxi %in% NA] <- median(House_Orig$Dist_Taxi, na.rm = TRUE)
House_Orig$Dist_Market[House_Orig$Dist_Market %in% NA] <- median(House_Orig$Dist_Market, na.rm = TRUE)
House_Orig$Dist_Hospital[House_Orig$Dist_Hospital %in% NA] <- median(House_Orig$Dist_Hospital, na.rm = TRUE)
House_Orig$Carpet[House_Orig$Carpet %in% NA] <- median(House_Orig$Carpet, na.rm = TRUE)
House_Orig$Builtup[House_Orig$Builtup %in% NA] <- median(House_Orig$Builtup, na.rm = TRUE)

House<-House_Orig[-361,]
View(House)

# boxplot(House_Orig$Dist_Taxi)# Outliers detected
# Outvalue<-boxplot.stats(House_Orig$Dist_Taxi)$out
# House_Orig$Dist_Taxi[House_Orig$Dist_Taxi %in% Outvalue]<-median(House_Orig$Dist_Taxi)
# 
# 
# boxplot(House_Orig$Dist_Market)# Outliers detected
# Outvalue<-boxplot.stats(House_Orig$Dist_Market)$out
# House_Orig$Dist_Market[House_Orig$Dist_Market %in% Outvalue]<-median(House_Orig$Dist_Market)
# 
# 
# boxplot(House_Orig$Dist_Hospital) # Outliers detected
# Outvalue<-boxplot.stats(House_Orig$Dist_Hospital)$out
# House_Orig$Dist_Market[House_Orig$Dist_Market %in% Outvalue]<-median(House_Orig$Dist_Market)
# 
# 
# boxplot(House_Orig$Carpet) # Outliers detected
# Outvalue<-boxplot.stats(House_Orig$Carpet)$out
# House_Orig$Carpet[House_Orig$Carpet %in% Outvalue]<- median(House_Orig$Carpet)
# 
# 
# boxplot(House_Orig$Builtup) #Outliers detected
# Outvalue<-boxplot.stats(House_Orig$Builtup)$out
# House_Orig$Builtup[House_Orig$Builtup %in% Outvalue]<- median(House_Orig$Builtup)
# 
# boxplot(House_Orig$Parking)
# boxplot(House_Orig$City_Category)
# 
# 
# boxplot(House_Orig$Rainfall)#Outliers detected
# Outvalue<-boxplot.stats(House_Orig$Rainfall)$out
# House_Orig$Rainfall[House_Orig$Rainfall %in% Outvalue]<- median(House_Orig$Rainfall)
# 
# 
# boxplot(House_Orig$House_Price)#Outliers detected
# Outvalue<-boxplot.stats(House_Orig$House_Price)$out
# House_Orig$House_Price[House_Orig$House_Price %in% Outvalue]<- median(House_Orig$House_Price)
# 




cor(House)

# So from the result we can safely deduce that Builtup and Carpet area are most strongly correlated
# to House Price.

# Model Making

model1<-lm(formula = House_Price~City_Category+Parking+Dist_Hospital+Dist_Market+Carpet, data = House)

summary(model1)



###############################With Clean Data############################

House_Clean<-read.csv('Regression-Clean-Data.csv')
View(House_Clean)
str(House_Clean)

House_Clean$Parking<-factor(House_Clean$Parking,levels(House_Clean$Parking) [c(2, 3, 4, 1)])
House_Clean$City_Category<-factor(House_Clean$City_Category, levels(House_Clean$City_Category) [c(3,2,1)])

House_Clean$Parking<-as.numeric(House_Clean$Parking)
House_Clean$City_Category<-as.numeric(House_Clean$City_Category)


# Data Cleaning
House_Clean<-House_Clean[,-c(1,2)]

sapply(House_Clean, function(x) sum(is.na(x)))

cor(House_Clean)
