--Em quantos conteúdos participa o Ator Keanu Reeves
--Número de Participações

SELECT * FROM Role JOIN RolePlayedInMovie ON Role.roleID = RolePlayedInMovie.roleID 
				   JOIN Movie ON Movie.movieID = RolePlayedInMovie.movieID 
				   JOIN CastMember ON CastMember.cmemberID = RolePlayedInMovie.cmemberID 
		   WHERE CastMember.cmembername = "Keanu Reeves";