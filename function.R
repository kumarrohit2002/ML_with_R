

#function..................
{
  
  sum<-function(){
    print("Hello world");
  }
  
  sum();
  
  
}

----------------------------
  #passing the parameter
  
{
  
  s<-function(a){
    print(a);
  }  
  s("Hello world");
    
  
}



# defalut value

{
  
  sum<-function(a="hi"){
    print(a);
  }
  sum();
  sum("hello");
  
}


-----------------------------------
  #return 
  
{

  
  Sum<-function(a){
    return (a)
  }  
  print(sum("hello"));
  
}

---------------------------------------------------------


{
  area<-function(a,b){
    return (a+b)
  }
  a<-as.integer(readline(prompt = "Enter the length : "))
  b<-as.integer(readline(prompt = "Enter the breadth : "))
  cat("Area of rectrangle is ",area(a,b))
}


-------------------------------------------
  

{
  
  
  summ<-function(a){
    return (sum(a))
  }
  
  Mean<-function(a){
    return (mean(a))
  }
  
  medium<-function(a){
    return (medium(a))
  }
  
  pro<-function(a){
    
      return(prod(a))
  }
  
  v<-c(1,2,3,4,5)
  
  
  print(summ(v))
  print(Mean(v))
  print(medium(v))
  print(pro(v))
  
  
  
}

----------------------------------------------

{
  
  
  sum1 <- function(a) {
    return(sum(a))
  }
  
  Mean <- function(a) {
    return(mean(a))
  }
  
  median1 <- function(a) {
    return(median(a))
  }
  
  prod1 <- function(a) {
    return(prod(a))
  }
  
  
  v <- c(1, 2, 3, 4, 5)
  
  #print(sum1(v))
  print(Mean(v))
  print(median1(v))
  print(prod1(v))
  


}
----------------------------------------------
  #factorial
  
  
  
  

{
  
  fact<-function(a){
    if(a==1 || a==0) return (1);
    return (a*fact(a-1));
  }
  print(fact(5))
  
  
}

--------------------------------------------

{
  fibo<-function(a){
    if(a==0) return (0);
    if(a==1) return (1);
    return (fibo(a-1)+fibo(a-2))
  }
  
  print(fibo(5))
  
  
  
  
}

















