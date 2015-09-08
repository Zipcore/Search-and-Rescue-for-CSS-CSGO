/**
 * Sends a message to specified team
 *
 * @param team			Team Index to sent the message to
 * @param message		Message to sent
 * @param alive_only	true sent the message to players who are alive false if all player regardless if dead or alive will receive the msg
 *
 * @noreturn
 */
stock void SendTeamMessage(int team, const char[] message, bool alive_only=false)
{
	for(int i=1; i < MaxClients; i++)
	{
		if(!IsClientConnected(i)) continue;
		if(!IsClientInGame(i)) continue;
		if(alive_only && !IsPlayerAlive(i)) continue;
		if(GetClientTeam(i) != CS_TEAM_NONE && GetClientTeam(i) != CS_TEAM_SPECTATOR)
		{
			if(GetClientTeam(i) == team)
			{
				PrintToChat(i,message);
			}
		}
	}
}
/**
 * Returns the Opposite team index of the given client
 *
 * @param client		Client to check the team for
 *
 * @return				Returns either CS_TEAM_T if client is CS_TEAM_CT or CS_TEAM_CT if client it CS_TEAM_T
 *						If client is CS_TEAM_SPECTATOR or CS_TEAM_NONE it will return CS_TEAM_NONE
 */
stock int GetOppositeTeam(int client)
{
	if(GetClientTeam(client) != CS_TEAM_NONE && GetClientTeam(client) != CS_TEAM_SPECTATOR)
	{
		if(GetClientTeam(client) == CS_TEAM_CT)
			return CS_TEAM_T;
		else
			return CS_TEAM_CT;
	}
	return CS_TEAM_NONE;
}

/*
				
*/
