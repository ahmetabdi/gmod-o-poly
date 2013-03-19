AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )
include( 'shared.lua' )

function ENT:Initialize()
	--That very secret model dat is fully invisible ^-^
	self:SetModel( "models/hunter/plates/plate32x32.mdl" )
	
	--OMFG WI CAN'T TACH IT!
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_NONE )
	self.Entity:DrawShadow( false )
	--OMFG WI FROZE IT!
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
	end
	
end

--If damaged, does nothin'
function ENT:OnTakeDamage(dmg)
	return false
end