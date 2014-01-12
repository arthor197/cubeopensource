
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "hud.lua" )

include( 'shared.lua' )


// Serverside only stuff goes here

/*---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
---------------------------------------------------------*/
function GM:PlayerInitialSpawn( ply ) //"When the player first joins the server and spawns" function 
 
     ply:ConCommand( "team_menu" ) //Run the console command when the player first spawns 
 
 end //End the "when player first joins server and spawn" function 
 
 function GM:PlayerLoadout(ply) --"The weapons/items that the player spawns with" function
 
	ply:StripWeapons() -- This command strips all weapons from the player.
 
	if ply:Team() == 1 then
		ply:GiveAmmo( 255,	"Pistol", 		true )
		ply:Give( "grub_m9fs" )
		ply:SetModel( "models/player/combine_soldier.mdl" )
 
	elseif ply:Team() == 2 then
		ply:Give("grub_m9fs")
		ply:SetModel( "models/player/combine_soldier_prisonguard.mdl" )
 
	end
 
end
 
 function team_1( ply ) 
 
     ply:SetTeam( 1 )
	 ply:Spawn()
 end 
 
 function team_2( ply ) 
 
     ply:SetTeam( 2 )
	 ply:Spawn()
 end
 
function WeaponSelect( ply, cmd, args )
	if args[1] == "pistol" then
	        ply:Give( "grub_m9fs" )
		ply:ChatPrint( "You got a Beretta!" )
	end
	if args[1] == "smg" then
		ply:Give( "weapon_m24sd" )
		ply:ChatPrint( "You got a Sniper!" )
        end
end

function GM:ShowSpare1( ply )
    umsg.Start( "WeaponMenuDerma", ply )
    umsg.End()
end

function GM:ShowTeam( ply )
    umsg.Start( "set_team", ply )
    umsg.End()
end
 
concommand.Add( "weapon_take", WeaponSelect )
concommand.Add( "team_1", team_1 )
concommand.Add( "team_2", team_2 )