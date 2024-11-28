#Data Type -> Numetic ,Integer ,Logical ,Raw ,Complex ,Char

a<-10.2
typeof(a);

b<-10L
typeof(b)

c<-'a'
typeof(c)

d<-TRUE
typeof(d)

e<-(10+2i)
typeof(e)

f<-as.raw(10)
typeof(f)

#vector

vector<-c(10,20,30,40)
typeof(vector)

# precedence -> Char > Complex > Numeric > Integer > Logical > Raw

v<-c(10,10L,10+2i,TRUE,'a',as.raw(10));
typeof(v)

xy<- 5+10L+10+2i+TRUE # if we add char then error: non-numeric argument to binary operator
xy
class(xy)


#Operators

a<-as.integer(readline(prompt = "Enter the NUMber: "));
b<-as.integer(readline(prompt = "Enter the NUMber: "));

print(a+b);
print(a-b);
print(a*b);
print(a/b); # 10/20 =0.5
print(a%%b); # 10%%20 = 10
print(b%/%a); # 20 %/% 10 = 2
print(a^3); # 10^3 = 1000

#in vector

a1<-c(10,20)
b1<-c(30,50)


a1+b1
a1-b1
a1/b1
a1*b1
a1%%b1
a1%/%b1



a2<-c(10,20)
b2<-c(30,40,50)

a2+b2  #In a2 + b2 :longer object length is not a multiple of shorter object length

# AND ( && )
x<- TRUE && TRUE
x
y<- FALSE && TRUE
y

# OR ( || )

x<- TRUE || TRUE
x
y<- FALSE || TRUE
y

# diff b/w readline and scan

numbers <- scan()
print(numbers)

chars <- scan(what = character())
chars

a1<-as.integer(readline(prompt = "Enter the NUMber: "));
a2<-as.integer(readline(prompt = "Enter the NUMber: "));
op<-as.character(readline(prompt = "Enter the NUMber: "));

#if else 

if(op=='+'){
  print(a1+a2)
}else if(op=='-'){
  print(a1-a2)
}else if(op=='*'){
  print(a1*a2)
}else if(op=='/'){
  print(a1/a2)
}else{
  print("wrong input")
}

#switch case

result <- switch(op,
                 "+" = a1 + a2,
                 "-" = a1 - a2,
                 "*" = a1 * a2,
                 "/" = a1 / a2,
                 "wrong input"
)
print(result)


#List
#indexing

a<-list(10,20,30,40)
a[2]<-NULL  # we cann't assin null value
a[2]

var<-a[-3]
var

a[-2]=90 # assin in list all val 90 neglating index 2
a[1]



ch=list('a','b','c','d')
ch[3]

com<-list(10+2i,30+3i,10)
com[1]

log<-list(TRUE,FALSE,TRUE)
log[2]

lists<-list(a,ch,com,log)

lists[[3]][1]=NULL
lists[[3]][1]

# & and |
a<-c(1,2,3)
b<-c(0,3,4)

a&b
a|b


#assiment Operator:  = , <- , -> , ->> , <<-


#relational Operator:
x<-10
y<-20

x<y
x>y
x!=y
x<=y
x>=y

# Miscellaneous Operator 
a1<- 1:20
5 % in % a1

s<-seq(5:20)  # why so
s

#% * % # use for matrix multiplication


mtx1<-matrix(c(1,2,3 ,4,5,6) ,ncol = 3, nrow = 2 ,byrow = TRUE)
mtx1
mtx2<-matrix(c(1,5,6,7,8,6), ncol = 2,nrow = 3,byrow = TRUE)
mtx2

mtx1 %*% mtx2  #for multiplication

t(mtx1)  # for transpose

# Array

arr<-array(1:24 ,dim<-c(2,3,4))  # c(2=row, 3 =colomn ,and 4 =dimention)
arr







# Factor
fact<- factor(c('A+','A-','B+','B-','AB+','AB-','O+','O-'),levels = c('A','A+','A-','B+','B-','AB+','AB-','O+','O-'))

fact
fact1<- factor(c('A+','A-','B+','B-','AB+','AB-','O+','O-'),labels = c('A+','A-','B+','B-','AB+','AB-','O+','O-'))
fact1


fac1<- factor(c('a','b','c','d'),levels = c('a','b','c','d','e'))
fac1


fac2<- factor(c('a','b','c','d'),levels = c('a','b','c','d','e'),labels = c('AA','BB','CC')) #error
fac2

fac3<- factor(c('a','b','c','d'),levels = c('a','b','c','d'),labels = c('AA','BB','CC','DD','EE'))  #error
fac3






#factor for tempeture



temp<- factor(c(5,10,20,33,35,37),levels = c(1:40))
temp

temp2<- factor(c(5,10,20,33,35,37),levels = c(1:40))
temp2


# import file from local

file1<- read.csv(file.choose()) #select file menualy
class(file1);
View(file1);

getwd();  # check working directory path


#"C:\Users\Rohit Ranjan\Documents\OLYMPICS.csv"
file2<-read.csv("C:/Users/Rohit Ranjan/Documents/OLYMPICS.csv",stringsAsFactors = FALSE);

#header=TRUE  # then it show header of csv file
#header=FALSE #them it not show header of csv file
View(file2)
class(file2)
class(file2$Year)
summary(file2)


year<-file2$Year #extract coloumn year from file2
year





#condinal statment

#if else

n1=as.integer(readline(prompt = 'Enter n1: '))
n2=as.integer(readline(prompt = 'Enter n2: '))

if(n1<n2){
  print('n2 is greater')
}else if(n1==n2){
  print('both are equal')
}else{ 
  print('n1 is greater')
}

#switch case

n<-as.integer(readline(prompt = 'Enter n: '));

ans<- switch(n,
             'one',
             'two',
             'three',
             'four',
             'five'
);

ans


#count even numbers
v<-c(1:10);
c=0

for(i in v){
  if(i%%2) c=c+1;
}

c


#another way using while loop
i=1
c=0

while(i<length(v)+1){
  if(v[i]%%2==0){
    c=c+1;
  }
  i=i+1
}

c

#another way
x<-1
c=0

repeat{
  if(x%%2==0){
    c=c+1
  }
  if(x==10){
    break;
  }
}

print(c)


# table

t<-as.integer(readline(prompt = 'Enter number: '));

for(i in 1:10){
  cat(t,' * ',i,' : ',i*t,'\n');
}



#another way

t<-as.integer(readline(prompt = 'Enter number: '));
i=1;

repeat{
  cat(t,' * ',i,' : ',i*t,'\n');
  if(i==10){
    break;
  }
  i=i+1
}






