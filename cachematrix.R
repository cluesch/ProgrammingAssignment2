## Put comments here that give an overall description of what your
## functions do

## Create a vector which retains a matrix and its inverse, if calculated

makeCacheMatrix <- function(x = matrix()) {
	# Initialize inverse to NULL
    i <- NULL
	
	# Set function, set matrix plus inverse
    set <- function(y) {
        x <<- y
        i <<- NULL ## Clear out inverse on changes
    }
	# Get the matrix back
    get <- function() x
	
	# Set Inverse
    setinverse <- function(inv) i <<- inv

	# Get Inverse
    getinverse <- function() i

	# Return list with all the functions/methods
    list(
		set = set, 
		get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}

## Get the inverse from the cached matrix, if does not exist, create the
## inverse and cache it.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
	i <- x$getinverse()
	
	# If cached inverse exist, return it...
	if(!is.null(i)) {
		message("getting cached data")
        return(i)
	}
	
	# Else compute the inverse and store it
	data <- x$get()
	inv <- solve(data, ...)
	x$setinverse(inv)
	inv
}
