## These two functions make possible to calculate and store the inverse of a 
## matrix. After the first calculation, the result is saved on the special 
## matrix object, so it can be just returned whenever needed.


## This function creates a special matrix object, which is actually a list that
## can hold the supllied matrix and its inverse, after the first calculation.
## Input is a matrix:

makeCacheMatrix <- function(x = matrix()) {
      inv<- NULL                                  # resets the value of inv
      set <- function(y) {       
            x<<- y                                # changes the value of 
            inv<<- NULL                           # the x in the main function
      }
      get <- function() x                         # just prints x
      setinv<- function(solve) inv<<- solve       # sets inv at whatever 
                                                  # arg the user provides
      
      getinv<- function() inv                     # prints inv 
      list(set=set, get=get, 
           setinv=setinv, 
           getinv=getinv)                         #creates list of functions
}


## This function first checks if there's already a saved inverse on the special
## matrix object. If there's not, it calculates and saves it. Input is the 
## special matrix object.

cacheSolve <- function(x, ...) {
      inv <-x$getinv()                         # assigns the value of inv 
                                               # contained in x
      if(!is.null(inv)){ 
            message("no need to calculate again! let me get the cached data...")
            return(inv)                        # if there's saved value of inv,
                  }                            # doesn't cal again and return it
      
      data<-x$get()                            # gets the original matrix    
      inv<-solve(data, ...)                    # inverts the matrix
      x$setinv(inv)                            # saves the inverse matrix in x
      inv                                      # print inv
}
