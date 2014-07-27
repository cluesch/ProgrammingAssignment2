## Test the solution

## load functions
source("cachematrix.R")

# Create a two by two matrix
a <- matrix(data = 1:4, nrow=2, ncol=2)

# Create our cached version
aincache = makeCacheMatrix(a)

# Get the inverse
cacheSolve(aincache)
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

# Get the inverse out of the cache
cacheSolve(aincache)
## getting cached data
##     [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

# Update the matrix
aincache$set(matrix(data=3))

# First hit should not be a cache hit because of change
cacheSolve(aincache)
##          [,1]
## [1,] 0.3333333

# Now should be cached
cacheSolve(aincache)
## getting cached data
##           [,1]
## [1,] 0.3333333
