## creates special list containing function to set the value of the matrix
## then get the value, set the value of the inverse, get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {     ## start fx make empty matrix
  m <- NULL
  set <- function(y) {
    x <<- y                                ## X assigned y in diff enviro
    m <<- NULL
  }
  get <- function() x
  setinv <- funtion(inverse) m <<- inverse
  getinv <- function() m
  list(set = set, get = get, setinv = setinv, getmean = getmean)
  
}


## Calculate the inverse of the special matrix (above). however, first it checks
## to see if the inverse has already been calculated.  If so, it gets the inverse 
## from the cache and skips the calculation.  Otherwise, it computes the inverse and
## sets the value in the cache via the setinv function.

cacheSolve <- function(x, ...) {    ## Rtn a matrix the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {   ## inv has been calculated, go get cache data
       message("getting cached data")
       return(m)
    }                   ## or calculate the inverse
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    return(m)
}
