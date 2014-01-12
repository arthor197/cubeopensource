include( 'shared.lua' )
include( 'hud.lua' )

// Clientside only stuff goes here

function set_team() 
 
 TeamFrame = vgui.Create( "DFrame" ) 
 TeamFrame:SetPos( 100, ScrH() / 2 )
 TeamFrame:SetSize( 500, 500 ) //Set the size 
 TeamFrame:SetTitle( "Team Selection" ) //Set title 
 TeamFrame:SetVisible( true ) 
 TeamFrame:SetDraggable( true ) 
 TeamFrame:ShowCloseButton( true ) 
 TeamFrame:MakePopup() 
 
 team_1 = vgui.Create( "DButton", TeamFrame ) 
 team_1:SetPos( 30, 30 )
 team_1:SetSize( 100, 50 ) 
 team_1:SetText( "Spetsnaz" ) 
 team_1:SetColor(Color(255,0,0))
 team_1.DoClick = function()
 
     RunConsoleCommand( "team_1" )
	 TeamFrame:Close()
 
 end 
 
 team_2 = vgui.Create( "DButton", TeamFrame ) 
 team_2:SetPos( 30, 85 )
 team_2:SetSize( 100, 50 ) 
 team_2:SetText( "Navy Seals" )
 team_2:SetColor(Color(0,204,204)) 
 team_2.DoClick = function()
 
     RunConsoleCommand( "team_2" )
	 TeamFrame:Close()
 
 end 
 
end

function WeaponMenuDerma()

local WeaponFrame = vgui.Create("DFrame")
WeaponFrame:SetSize(250, 80)
WeaponFrame:Center()
WeaponFrame:SetTitle("Take the weapon that you want")
WeaponFrame:SetDraggable(true)
WeaponFrame:SetSizable(false)
WeaponFrame:ShowCloseButton(true)
WeaponFrame:MakePopup()
 
local PistolButton = vgui.Create("DButton", WeaponFrame)
PistolButton:SetSize(100, 30)
PistolButton:SetPos(10, 35)
PistolButton:SetText("Pistol")
PistolButton.DoClick = function()

	RunConsoleCommand("weapon_take", "pistol") 
	WeaponFrame:Close()
	
end
 
local SMGButton = vgui.Create("DButton", WeaponFrame)
SMGButton:SetSize(100, 30)
SMGButton:SetPos(140, 35)
SMGButton:SetText("SMG") --Set the name of the button
SMGButton.DoClick = function() 

	RunConsoleCommand("weapon_take", "smg")
	WeaponFrame:Close() 
	
 end
 
end

usermessage.Hook( "WeaponMenuDerma", WeaponMenuDerma )
usermessage.Hook( "set_team", set_team )
concommand.Add( "selectweapon", WeaponMenuDerma )
concommand.Add( "team_menu", set_team ) 