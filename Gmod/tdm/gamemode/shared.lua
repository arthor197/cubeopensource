
GM.Name 	= "Team Deathmatch"
GM.Author 	= "The Cube Programming"
GM.Email 	= "N/A"
GM.Website 	= "forums.thecubeserver.com"

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
end
team.SetUp( 1, "Spetsnaz", Color( 125, 125, 125, 255 ) )
team.SetUp( 2, "Navy Seals", Color( 125, 125, 125, 255 ) )