## Put comments here that give an overall description of what your
## functions do

## The two funtions illustrated below allow the inverse of a matrix to be calculated, cached and then recalled at a latter
##time without having to recalculate the inverse again.

## First function
## Take the passed matrix and create a list of functions to
## Set the value of the matrix
## Get the value of the matrix
## Set the value of the inverse
## Get the value of the inverse

makeCacheMatrix <- function(x = matrix()){
        inv <- NULL                                       	#Initialize the 'inv' variable to NULL
                
        set <- function(y){                               	#Define function 'set'
                x <<- y                                         #set the local 'x' to the passed arg 'y'    
                inv <<- NULL                			#set 'inv' variable to NULL
        }
        
        get <- function() x                                     #Define function 'get' for the makeCacheMatrix environ   

        setinv <- function(inverse) inv <<- inverse             #Define function 'setinv' 
                                                                #set variable 'inverse' equal to 'inv' from the 
								#makeCacheMatrix environ 	


        getinv <- function() inv      				#Define function 'getinv' returns the value of 'inv'
								#from the makeCacheMatrix environ                          


        list(set = set, get = get,                        	#Set the vaiables of the makeCacheMatrix environ 
             setinv = setinv,					#into a list for calling
             getinv = getinv)
}

## This second function checks to see if the inverse of the matrix exists, if the inverse exists it is returned as a value. 
## If it does not exist the inverse is calculated and then returned.


cachesolve <-function(x, ...){
								## Return a matrix that is the inverse of 'x'
                
        inv <- x$getinv()					#set the variable 'inv' equal to the value of 'inv'
								#in the x environment
        
        if(!is.null(inv)){					#Check the value of 'inv' if previously defined
                message("getting cached data")			#the print the messagge and return the variable,
                return(inv)					#the cached inverse
        }
       
        data <- x$get()						#If this 'x' has not been evaluated, assign it to the 
								#local variable 'data'
        
        inv <- solve(data, ...)					#Calculate the value of the inverser for 'data"
        
        x$setinv(inv)						#Assign the inverse to the x environment

        inv							#Print the value of the calculated mean
}