Quantos filmes tem qualidade Full HD

SELECT Count(contentname) FROM Content INNER JOIN Movie ON Movie.movieID = Content.contentID WHERE imgquality > 1 ;
