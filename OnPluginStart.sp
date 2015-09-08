public void OnPluginStart()
{
	HookEvent("player_death",Event_PlayerDeath);
	HookEvent("round_freeze_end",Event_RoundFreezeEnd);
	HookEvent("round_end",Event_RoundEnd);
	HookEvent("bomb_exploded",Event_RoundEnd);
	HookEvent("bomb_defused",Event_RoundEnd);
	CreateTimer(1.0,t_GlobalTimer,_,TIMER_REPEAT);
	
	RegAdminCmd("sm_spawn",Command_Spawn,ADMFLAG_ROOT);
	
	CreateConVar("sm_sar_version",VERSION,"Version of the Search and Rescue Plugin",FCVAR_NOTIFY|FCVAR_PLUGIN|FCVAR_REPLICATED);
	sm_sar_dogtag_time = CreateConVar("sm_sar_dogtag_time","40","Time in seconds an ally can be respawned",FCVAR_NOTIFY,true,10.0);
	sm_sar_dogtag_distance = CreateConVar("sm_sar_dogtag_distance","128","Distance a player must be to pickup the dogtag",FCVAR_NOTIFY,true,64.0);
	
	sm_sar_dogtag_distance.AddChangeHook(OnDogTagDistanceChanged);
}