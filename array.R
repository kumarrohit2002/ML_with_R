

# cbind and ebind function (coloumn and row bind functions)

{
  
  mtx1=matrix(c(1,2,3,4,5,6),nrow=3,ncol=2)
  mtx1
  newMtx=cbind(matrix(c(8,9,10)))
  newMtx
  
  
  new2<-rbind(matrix,c(1,2))
  new2
  
  
}

--------------------------------------------
  
{
  
  # Array
  a<-c(1:20)    # using vector
  a
  
  b<-array(a,dim=c(4,3,1))
  b
  
  b<-array(a,dim=c(4,3,2))
  b
  dim(b)   # number of rows and  columns of array
    
    
}

------------------------------------------------------
  
  
  
{
  
    
    a[2,3,1]   #2nd row 3rd coloumn and first dimension
    a[c(1), ,1]   #first row , all the columns and first dimention 
    a[ , c(1), 1]  #all rows, first column and first dimenstion
    
    length(a)   #length of array
    
    dim(a)
    
    
}


