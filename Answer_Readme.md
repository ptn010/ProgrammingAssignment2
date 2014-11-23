### Answer

This second programming assignment will require you to write an R
function that is able to cache potentially time-consuming computations.

### Example
* ma<-matrix(c(1,1,1,3,4,3,3,3,4),3,3)
* ma                                   ##print out ma (for easy review)
* ma_c<-makeCacheMatrix(ma)            ##make special "matrix"
* cacheSolve(ma_c)                       ##Solve for first time. No value in     cache.
* cacheSolve(ma_c)                    ##Solve for second time.Cached value returned. The message of "getting cached data" is returned. 