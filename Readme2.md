##'Eigenface' Face Recognition System
 

###Summary
* This package implements a well-known PCA-based face recognition 
method, which is called 'Eigenface'. 
* In general, follow this order:

1. Select training database paths.
2. Get Ready for image to be taken
3. Run 'CreateDatabase' function to create 2D matrix of all training images.
4. Run 'EigenfaceCore' function to produce basis's of facespace.
5. Run 'Recognition' function to get the name of equivalent image in training database.  


