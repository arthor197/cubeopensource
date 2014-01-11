hudtable = {}
hudtable.colorwhite = Color( 255, 255, 255, 255 )
hudtable.colorblack = Color( 0, 0, 0, 255 )
 
function hud() --hud
if !(LocalPlayer() and LocalPlayer():Alive()) then return end
if !(LocalPlayer():GetActiveWeapon() and IsValid(LocalPlayer():GetActiveWeapon())) then return end
 
local client = LocalPlayer()
local weaponname = client:GetActiveWeapon():GetPrintName()
local health = client:Health()
local ammo = client:GetActiveWeapon():Clip1() --amount of ammo in the magazine
local ammo2 = client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()) --amount of ammo left
local kd = math.Round(100 * client:Frags() / client:Deaths()) / 100
local name = client:Nick()
local maxammo = client:GetActiveWeapon().Primary.ClipSize
 
//Name
draw.RoundedBox(8, 10, ScrH() - 80 - 50 , 250, 120, Color(0,0,0,240)) --black box
 
//group name
draw.SimpleText(name, "default", 20, ScrH() - 120, hudtable.colorwhite ) --shows the name of the client
if client:IsSuperAdmin() then draw.SimpleText("Rank: SuperAdmin", "default", 20, ScrH() - 100, Color( 255, 0, 0, 255 ) )
elseif client:IsAdmin() then draw.SimpleText("Rank: Admin", "default", 20, ScrH() - 100, Color( 0, 255, 0, 255 ) )
elseif client:IsUserGroup("VIP") then draw.SimpleText("Rank: VIP", "default", 20, ScrH() - 100, Color( 0, 0, 255, 255 ) )    
elseif !client:IsUserGroup("VIP") then draw.SimpleText("Rank: Normal", "default", 20, ScrH() - 100, Color( 200, 200, 200, 255 ) ) end
 
//Kill Death Ratio
if client:Deaths() > 0 then
draw.SimpleText("K/D = "..kd, "default", 20, ScrH() - 80, hudtable.colorwhite )
else draw.SimpleText("K/D = 0", "default", 20, ScrH() - 80, hudtable.colorwhite ) end
 
//HEALTH
draw.RoundedBox(0, 20, ScrH() - 60, 200, 20, Color(0,0,0,255)) --health shade
draw.RoundedBox(0, 20, ScrH() - 60, health * 2, 20, Color(255,0,0,255)) --health box
draw.SimpleText(health, "default", 20, ScrH() - 60, hudtable.colorwhite ) --health number
 
//AMMO
if weaponname == "#HL2_Crowbar" then return
elseif weaponname == "#HL2_GravityGun" then return
elseif weaponname == "HL2_Grenade" then return end
draw.RoundedBox(0, 20, ScrH() - 40 , 200 /  ammo, 20, Color(100,100,100,255)) --ammo bar
draw.SimpleText(ammo.."/", "default", 20, ScrH() - 40, hudtable.colorwhite ) --ammo number
draw.SimpleText(ammo2, "default", 55, ScrH() - 40, hudtable.colorwhite ) --ammo number
end
hook.Add("HUDPaint", "Hud", hud)
 
function hidehud(name)
        for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
                if name == v then return false end
        end
end
hook.Add("HUDShouldDraw", "HideHud", hidehud)