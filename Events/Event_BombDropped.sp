public Action Event_BombDropped(Event event, const char[] name, bool dontBroadcast)
{
	int ent = -1;
	while ((ent = FindEntityByClassname(ent, "weapon_c4")) != -1)
	{
		AcceptEntityInput(ent,"Kill");
	}
}