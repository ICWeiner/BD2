--numero de episodios de cada serie

SELECT Show.showname AS Show,
	  COUNT(Episode.epnumber) AS Numero_de_Episodios 
	  FROM Show, Season, Episode WHERE Season.seasonID = Episode.seasonID AND Show.showID = Season.showID GROUP BY Show.showname;
