#filter()(and slice())
#arrange()
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

dddddd




