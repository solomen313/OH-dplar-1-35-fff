#filter()(and slice())- subsetting rows
#arrange()- sorting the data.frame by colums
#select()(and rename())
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

###fuck every step is hard!!!!
