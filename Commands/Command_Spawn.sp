public Action Command_Spawn(int client, int args)
{
	if(args < 1)
	{
		CanRespawn[client] = true;
		int team = GetRandomInt(2,3);
		CS_SwitchTeam(client,team);
		CS_RespawnPlayer(client);
	}
	else
	{
		char arg1[32];
		GetCmdArg(1,arg1,sizeof(arg1));
		int target = FindTarget(client,arg1,false,false);
		if(target == -1)
		{
			return Plugin_Handled;
		}
		else
		{
			CanRespawn[target] = true;
			int team = GetRandomInt(2,3);
			CS_SwitchTeam(target,team);
			CS_RespawnPlayer(target);
		}
	}
	return Plugin_Handled;
	
}