Answer to Programming Assignment 2
========================================================

### Answer

The functions cache potentially time-consuming computations, in this case the inverse of a given matrix.


### Example

```r
ma<-matrix(c(1,1,1,3,4,3,3,3,4),3,3)
ma                                   ##print out ma (for easy review)
ma_c<-makeCacheMatrix(ma)            ##make special "matrix"
cacheSolve(ma_c)                       ##Solve for first time. No value in     cache.
cacheSolve(ma_c)                    ##Solve for second time.Cached value returned. The message of "getting cached data" is returned. 
```
