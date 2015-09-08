public Action Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	if(RoundActive)
	{
		int client = GetClientOfUserId(event.GetInt("userid"));
		GetClientAbsOrigin(client,DogTagPos[client]);
		DogTagTeam[client] = GetClientTeam(client);
		DogTagActive[client] = sm_sar_dogtag_time.IntValue;
		DogTagPos[client][2] += 8; // raise up the glow sprite
	}
}