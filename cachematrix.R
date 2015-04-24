## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
      inv<- NULL                 # resets the value of inv
      set <- function(y) {       
            x<<- y               # changes the value of the x in the main function
            inv<<- NULL  
      }
      get <- function() x        # just prints x
      setinv<- function(solve) inv<<- solve    # sets inv at whatever 
                                               # arg the user provides
      
      getinv<- function() inv                  # prints inv 
      list(set=set, get=get, setinv=setinv, getinv=getinv) #creates list of functions
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
      inv <-x$getinv()
      if(!is.null(inv)){
            message("no need to calculate again.
                    let me get the cached data...")
            return(inv)
      }
      data<-x$get()
      
}
