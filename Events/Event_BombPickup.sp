public Action Event_BombPickup(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	int weapon = GetPlayerWeaponSlot(client,CS_SLOT_C4);
	if(weapon != -1)
	{
		RemovePlayerItem(client,weapon);
	}
}