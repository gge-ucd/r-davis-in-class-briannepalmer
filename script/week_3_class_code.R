#week 3 class code

read.csv("data/tidy.csv")

x<-4 #vector of length 1 

#c() combine a series of values into a vector

#vectors

weight_g <- c(50,60,31,89)
weight_g

#now characters

animals <- c("mouse", "rat", "dog", "cat")
animals

#vector exploration tools 

length(weight_g)
length(animals)
class(weight_g)
class(animals)
str(weight_g)
str(x)
str(animals)

#be careful about adding values and running this line multiple times 
weight_g <- c(weight_g, 105)
weight_g
weight_g <- c(25, weight_g)
weight_g

# 4 types of atomic vector: numeric (double), character, logical, integer, complex, and raw. Complex and raw are not used as frequently. 

typeof(weight_g)

weight_integer <- c(20L, 21L, 85L) #this is how R stores integers 
class(weight_integer)
typeof(weight_integer)

#columns and vectors are similar, keep only one type of data insides a vector 

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE) 
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

combined_logical <- c(num_logical, char_logical)

#heirarchy to how classes are converted...character, numeric, logical. 
#Coersion is when R changes the variable to a specific type \

#subsetting vectots
animals[3]
aniamsl [c(2,3)]

#conditional subsetting 
weight_g[c(T,F,T,T,F,T,T)]
weight_g >50
weight_g[weight_g>50]

#multiple conditions
weight_g[weight_g <30 | weight_g>50]

#searching for characters
animals[animals == "cat" | animals == "rat"]
animals %in% c("rat", "antelope", "jackalope", "hoppogriff")
animals[animals %in% c("rat", "antelope", "jackalope", "hoppogriff")]

#challenge 
"four" > "five" #it is sorting them alphabetically 

#missing values 

heights <- c(2,4,4, NA, 6)
str(heights)

mean(weight_g)
mean(heights)

mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

is.na(heights)
na.omit(heights)
complete.cases(heights)
