public Action t_GlobalTimer(Handle timer)
{
	if(timer != null)
	{
		if(!RoundActive) return Plugin_Continue;
		for(int i = 1; i < MaxClients; i++)
		{
			if(!IsClientConnected(i)) continue;
			if(!IsClientInGame(i)) continue;
			if(DogTagActive[i] > 0) // Display it aslong as its available
			{
				DogTagActive[i] --;
				TE_SetupGlowSprite(DogTagPos[i],RedGlow,0.3,1.0,255);
				TE_SendToAll();
			}
			else
			{
				DogTagActive[i] = 0;
				DogTagPos[i] = NULL_VECTOR;
				DogTagTeam[i] = CS_TEAM_NONE;
			}
		}
		
		for(int client=1; client < MaxClients; client++)
		{
			if(!IsClientConnected(client)) continue;
			if(!IsClientInGame(client)) continue;
			if(!IsPlayerAlive(client)) continue;
			float ClientOrigin[3];
			GetClientAbsOrigin(client, ClientOrigin);
			for(int i = 1; i < MaxClients; i++)
			{
				if(!IsClientConnected(i)) continue;
				if(!IsClientInGame(i)) continue;
				if(IsPlayerAlive(i)) continue;
				if(DogTagActive[i] && GetVectorDistance(ClientOrigin,DogTagPos[i]) < DogTagDistance)
				{
					if(GetClientTeam(client) != DogTagTeam[i])
					{
						CanRespawn[i] = false;
						DogTagActive[i] = 0;
						DogTagTeam[i] = CS_TEAM_NONE;
						DogTagPos[i] = NULL_VECTOR;
						SendTeamMessage(GetOppositeTeam(i),"[S&R]: Enemy Eliminated");
						SendTeamMessage(GetClientTeam(i),"[S&R]: Ally Eliminated");					
					}
					else
					{
						CS_RespawnPlayer(i);
						DogTagActive[i] = 0;
						DogTagTeam[i] = CS_TEAM_NONE;
						DogTagPos[i] = NULL_VECTOR;
						SendTeamMessage(GetClientTeam(i),"[S&R]: Ally Rescued");
						SendTeamMessage(GetOppositeTeam(i), "[S&R]: Enemy Rescued");
					}
					break;
				}
			}
		}
	}
	return Plugin_Continue;
}