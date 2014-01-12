hudtable = {}
hudtable.colorwhite = Color( 225, 0, 0, 255 )
hudtable.colorblack = Color( 50, 50, 50, 100 )
hudtable.colorhealth = Color( 225, 225, 225, 225 )

if CLIENT then 

	include( "shared.lua" ) 

	standardFont = "Bebas Neue"

	surface.CreateFont( "Deathrun_Smalltext", { font = standardFont, size = 18, weight = 300, antialias = true } )
	surface.CreateFont( "Deathrun_Smooth", { font = standardFont, size = 22, weight = 300, antialias = true } )
	surface.CreateFont( "Deathrun_Smooth2", { font = standardFont, size = 26, weight = 300, antialias = true } )
	surface.CreateFont( "Trebuchet22", { font = standardFont, size = 22, weight = 300, antialias = true } )
	surface.CreateFont( "Trebuchet24", { font = standardFont, size = 24, weight = 300, antialias = true } )
	surface.CreateFont( "Deathrun_SmoothMed", { font = standardFont, size = 28, weight = 300, antialias = true } )
	surface.CreateFont( "Deathrun_SmoothBig", { font = standardFont, size = 30, weight = 300, antialias = true } )
	surface.CreateFont( "Deathrun_BebasBig", { font = standardFont, size = 38, weight = 300, antialias = true } )
	surface.CreateFont( "Deathrun_BebasBig2", { font = standardFont, size = 84, weight = 300, antialias = true } )



	surface.CreateFont( "HUDFont",
                                        { size    = 20,
                                        weight    = 30,
                                        antialias = true,
                                        shadow    = false,
                                        font      = standardFont
                                })

	

	



	surface.CreateFont( "HUDFont2",
                                        { size    = 25,
                                        weight    = 30,
                                        antialias = true,
                                        shadow    = false,
                                        font      = standardFont
                                })

	

	


	surface.CreateFont( "HUDFontBig",
                                        { size    = 25,
                                        weight    = 125,
                                        antialias = true,
                                        shadow    = false,
                                        font      = standardFont
                                })

	

	


end
 
function hud() --hud
if !(LocalPlayer() and LocalPlayer():Alive()) then return end
if !(LocalPlayer():GetActiveWeapon() and IsValid(LocalPlayer():GetActiveWeapon())) then return end
 
local client = LocalPlayer()
local weaponname = client:GetActiveWeapon():GetPrintName()
local health = client:Health()
local ammo = client:GetActiveWeapon():Clip1() --amount of ammo in the magazine
local ammo2 = client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()) --amount of ammo left
local kd = math.Round(100 * client:Frags() / client:Deaths()) / 100
local steamid = client:SteamID( )
 
//SteamID
draw.RoundedBox(0, 10, ScrH() - 80 - 50 , 325, 120, Color(0,0,0,125)) --black box
draw.SimpleText(steamid, "HUDFont", 20, ScrH() - 120, hudtable.colorwhite ) --shows the SteamID of the client
 
//Rank
if client:IsSuperAdmin() then draw.SimpleText("RANK - SUPERADMIN", "HUDFont", 20, ScrH() - 100, Color( 255, 0, 0, 255 ) )
elseif client:IsAdmin() then draw.SimpleText("RANK - ADMIN", "HUDFont", 20, ScrH() - 100, Color( 0, 255, 0, 255 ) )
elseif client:IsUserGroup("VIP") then draw.SimpleText("RANK - VIP", "HUDFont", 20, ScrH() - 100, Color( 0, 0, 255, 255 ) )    
elseif client:IsUserGroup("Player") then draw.SimpleText("RANK - USER", "HUDFont", 20, ScrH() - 100, Color( 200, 200, 200, 255 ) ) end
 
//Kill Death Ratio
if client:Deaths() > 0 then
draw.SimpleText("SCORE: "..kd, "HUDFont", 20, ScrH() - 80, hudtable.colorwhite )
else draw.SimpleText("SCORE - 0", "HUDFont", 20, ScrH() - 80, hudtable.colorwhite ) end
 
//HEALTH
draw.RoundedBox(0, 20, ScrH() - 60, 200, 20, Color(100,100,100,50)) --health shade
draw.RoundedBox(0, 20, ScrH() - 60, health * 2, 20, Color(255,0,0,200)) --health box
draw.RoundedBox(0, 20, ScrH() - 60, health * 2, 20, Color(153,0,0,35)) --health box
draw.SimpleText(health, "HUDFont", 20, ScrH() - 60, hudtable.colorhealth ) --health number
 
//AMMO
if weaponname == "#HL2_Crowbar" then return
elseif weaponname == "#HL2_GravityGun" then return
elseif weaponname == "HL2_Grenade" then return end
draw.SimpleText(ammo.."/", "HUDFont2", 20, ScrH() - 40, hudtable.colorwhite ) --ammo number
draw.SimpleText(ammo2, "HUDFont2", 55, ScrH() - 40, hudtable.colorwhite ) --ammo number
end
hook.Add("HUDPaint", "Hud", hud)
 
function hidehud(name)
        for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudCrosshair", "CHudSecondaryAmmo"}) do
                if name == v then return false end
        end
end
hook.Add("HUDShouldDraw", "HideHud", hidehud)