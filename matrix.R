# Matrix in r

{
  
  x<- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
  x
  
}

{
  
  x<-matrix(c(1,2,3,4,5,6),nrow=3,ncol=3,byrow=TRUE)
  x
  
}
-----------------------------------------------------------

{
  
  x[2,3]
  x[ ,3] #all the rows and  3rd column
  x[1, ] #first row and all the column
  x[c(1,2),]   #first and second row with all the column
  
}

--------------------------------------------------------
{
  # Sum of matrix ...................
  
  x<- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
  y<- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
  z<-x+y
  z
  
}

------------------------------------------------------------
  
  
  # sum of matrix......................
  
{
  
    x<-as.integer(readline(prompt ="Enter the no of row: " ))
    y<-as.integer(readline(prompt = "Enter the no of column: "))
    mtx1<-matrix(,nrow=x,ncol=y,byrow=TRUE)
    mtx2<-matrix(,nrow=x,ncol=y,byrow=TRUE)
    
    print("Enter the mtrix1 element: ")
    for(i in 1:x){
      for(j in 1:y){
        mtx1[i,j]<-as.integer(readline())
      }
    }
    print("Enter the mtrix2 element: ")
    for(i in 1:x){
      for(j in 1:y){
        mtx2[i,j]<-as.integer(readline())
      }
    }
    for(i in 1:x){
      for(j in 1:y){
        print(mtx3[i,j])
      }
    }
    mtx3=mtx1+mtx2
    mtx3
    
}



---------------------------------------------------------------


  
{
  
    
  x<-as.integer(readline(prompt ="Enter the no of person data: " ))
  mtx<-matrix("",nrow=x,ncol=3,byrow=TRUE)
  colnames(mtx)=c("ID","NAME","AGE")
  
  print("Enter the mtx data: ID name Age"  )
  
  
  for(i in 1:x){
    for(j in 1:3){
      mtx[i,j]<-readline()
    }
  }
  
  
  mtx  
    
}









