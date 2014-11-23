## This is written for assignment2 of Dr. Peng's R Programming Course
## Assignment 2 asked functions that is able to cache potentially time-consuming 
## computations, in this case matrix inversion


## This function creates a special "matrix" object that can cache its inverse
## The special "matrix" is actually a list containing a function to
##    set the value of the matrix
##    get the value of the matrix
##    set the value of the matrix inverse
##    get the value of the matrix inverse
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }           ##    set the value of the matrix and assign inverse to be NULL
    get <- function() x   ##    get the value of the matrix
    setInv <- function(invSol) inv <<- invSol  ##    set the value of the mean
    getInv <- function() inv
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
    
}


## This function returns a matrix that is the inverse of 'x'
## It computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Get the inverse from x (either cached or NULL)
    inv <- x$getInv()
    ## if inverse is already cached, return this value and get out of the function
    if( !is.null(inv)) {                    
        message ("getting cached data")
        return(inv)
    }
    ## if inverse was not cached, i.e. not computed, get the matrix
    data <-x$get()  
    ## calculate inverse
    inv <- solve(data, ...)
    ## pass inv value to be cached in function makeCacheMatrix
    x$setInv(inv)
    ## return the inverse
    inv
}

##EXAMPLE
#ma<-matrix(c(1,1,1,3,4,3,3,3,4),3,3)
#ma                                   ##print out ma (for easy review)
#ma_c<-makeCacheMatrix(ma)            ##make special "matrix"
#cacheSolve(ma_c)                     ##Solve for first time. No value in cache when called. Cache value of inverse.
#cacheSolve(ma_c)                     ##Solve for second time.Cached value returned. Message printed saying "getting cached data"
