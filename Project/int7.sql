SELECT TIME(SUM(duration)) 
FROM Content, movie WHERE content.contentID = movie.movieID;