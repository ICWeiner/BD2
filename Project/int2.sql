Qual o rating do filme "John Wick"

SELECT avg(rating) FROM ContentView
INNER JOIN Content ON Content.contentID = ContentView.contentID WHERE Content.contentname="John Wick" AND rating > 0;
