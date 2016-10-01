##My funtions will be used to cache the inverse of a matrix, 
##which is the assignment of R programming Week 3
##This function creates special "matrix" object, which is a list containing a function to 
##set the value of the matrix
##get the value of the matrix
##set the value of the inverse
##get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
    ##create a matrix object x  
    
    ##add sub functions to define the cache k as NULL, which holds value of matrix inverse
  k <- NULL
  set <- fuction(y) {
      x <<-y
      ## assign new value of matrix x in the parent environment
      k <<- NULL
      ##re-initiallize k to NULL in the parent environment
    }
  get <- function() x ##return the value of matrix x
  setinverse <- function(inverse) k <<- inverse 
  ##set the cache k equal to inverse of matrix x
  getinverse <- function() k
  ##get the value of inverse
  list(set = set, get = get,
      setinverse = setinverse
      getinverse = getinverse)
}
## The function computes the inverse of the special "matrix" created with the above function. 
##It first checks to see if the inverse has already been calculated. 
##If so, it gets the inverse from the cache and skips the computation. 
##Otherwise, the cachesolve computes the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  k <- x$getinverse()
  if(!is.null(k)) {
    message("getting cached data")
    return(k)
  }
  data <- x$get()
  k <- solve(data, ...)
  x$setinverse(k)
  k
}
