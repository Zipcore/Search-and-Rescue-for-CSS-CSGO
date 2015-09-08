public Action Event_RoundEnd(Event event, const char[] name, bool dontbroadcast)
{
	for(int i=1; i<MaxClients; i++)
	{
		if(IsClientConnected(i) && IsClientInGame(i))
		{
			SetEntityMoveType(i,MOVETYPE_NONE);
			DogTagActive[i] = 0;
			DogTagPos[i] = NULL_VECTOR;
			DogTagTeam[i] = CS_TEAM_NONE;
		}
	}
	RoundActive = false;
}

public Action Event_RoundFreezeEnd(Event event, const char[] name, bool dontBroadcast)
{
	if(event != null)
	{
		if(RoundActive == false)
		{
			RoundActive = true;
		}
		for(int i=1; i<MaxClients; i++)
		{
			if(IsClientConnected(i) && IsClientInGame(i))
			{
				if(GetClientTeam(i) == CS_TEAM_CT || GetClientTeam(i) == CS_TEAM_T)
				{
					CanRespawn[i] = true;
				}
			}
		}
	}
}