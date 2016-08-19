#filter()(and slice())- subsetting rows
#arrange()- sorting the data.frame by colums
#select()(and rename()-renami)
#distinct()
#mutate()(and transmute())
#summarise()
#sample_n() and sample_frac()


library(dplyr)
head(mtcars)

#base 
colnames(mtcars)
rownames(mtcars)

colnames(mtcars)[1]
colnames(mtcars)[1] = "Miles_Per_Gallon"

colnames(mtcars)[1] = "mpg"


mtcars2 = rename(mtcars,
                 Miles_Per_Gallon = mpg,
                 cylinders = cyl)

head(mtcars2[,1:3])

mtcars%>%rename(disp_change = disp) # check the pipeline by solomen313

library(dplyr)
mt_over20 <- filter(mtcars,mpg > 20)
head(mt_over20)

mt = mtcars
mt$Car <- rownames(mt)

mt$Car

mt_over20 <- filter(mtcars,mpg > 20)

mt%>%filter(mpg>20,cyl==6) #Same as mt_over20_6cy1.The pipeline command %>% is good
                           #multipul steps of the data mangement.Since one do not need
                           #creat so many new data set ,such as mt_over20_6cy1,that confuse
                          #oneself afer few days.

mt_over20_6cyl <- filter(mt,
                         mpg > 20,
                         cyl==6) #This one is clear enough!
mt_over20_6cyl

mt_over20_or_6cyl <- filter(mt,
                         mpg > 20|
                         cyl==6)

mt_over20_or_6cyl
head(mt_over20_or_6cyl)

mt_mpg_sort = arrange(mt,cyl,desc(mpg))
head(mt_mpg_sort)
##This time may be work well!

tail(mt_mpg_sort)


carbdf = select(mt,carb,mpg)
carbdf = mt[,c("carb","mpg")] # base command as select~
head(carbdf)


mt["Mazda RX4",]# requires rownames
mt[mt$Car == "Mazda RX4"]
filter(mt,Car == "Mazda RX4")

head(mt)
?mutate

mt = mutate(mt,mpg2 = mpg^2)  #using dplyr
mt$mpg2 = mt$mpg^2 #standard R syntax 
  #using dplyr

mt$mpg2 = mt$mpg^2
mt$cyl2 = mt$cyl^2
mt$disp2 = mt$disp^2 # Standard R Syntax

mt = mutate(mt,
            mpg2 = mpg^2,
            cyl2 = cyl^2,
            disp2 = disp^2)  #using dplyr

mt%>%mutate(mpg2 = mpg^2,
            cyl2 = cyl^2,
            disp2 = disp^2) #using pipe!

mt%>%mutate(mpg2 = mpg^2,
            cyl2 = cyl^2,
            disp2 = disp^2,
            x = rep(1:3,
                    length = nrow(mt))) #using pipe!

mt%>%
  mutate(mpg2 = mpg^2,
            cyl2 = cyl^2,
            disp2 = disp^2,
            over20_mpg = mpg > 20)%>% #creat a condition of mpg
            arrange(over20_mpg)%>% # arrange the over20_mpg
            filter(over20_mpg == F) # 

mt%>%mutate(mpg2 = mpg^2,
            cyl2 = cyl^2,
            disp2 = disp^2)%>%
   filter(mpg < 20)# choose the cars whose mpg < 20 

head(mt)



###################################
mt1 = mutate(mt,am_V = 1-am)      #
head(mt1%>%select(am,am_V))                         #
mt1%>%select(am,am_V)             #
###################################  Item reversion !




mt5 =mt %>%	filter(mpg < 20) 
mt5%>%
  mutate(x = rep(0,
                 length = nrow(mt5)))

mt$mpg2 = NULL # remove mpg2 column
head(mt)


mt%>%
  mutate(mpg2 = mpg^2,
         cyl2 = cyl^2,
         disp2 = disp^2,
         over20_mpg = mpg > 20,
         mpg2_over140 = mpg2 > 140)


mt%>%
  transmute(Car,
            mpg2 = mpg^2,
         cyl2 = cyl^2,
         disp2 = disp^2,
         over20_mpg = mpg > 20,
         mpg2_over140 = mpg2 > 140)

ll <- c(a1:a20)
ll

summarise(mt,
          mean_cyl = mean(cyl),
          max_cyl = max(cyl),
          q25_cyl = quantile(cyl,probs = 0.25)
)
library(plyr)
summarise(group_by(mt,cyl),
          mean_mpg = mean(mpg)
)
