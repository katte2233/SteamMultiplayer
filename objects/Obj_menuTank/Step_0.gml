if(imprintCooldown <= 0)
{
	menu_imprint_snow(self);
		
	imprintCooldown = imprintCooldownMax;
}else imprintCooldown--;