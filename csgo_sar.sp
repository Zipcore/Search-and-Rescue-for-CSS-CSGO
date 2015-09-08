#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <cstrike>
#pragma newdecls required

#define VERSION "1.0"


#include "variables.sp"

public Plugin myinfo = 
{
	name = "[CS:GO & CSS] Search and Rescue",
	author = "XeroX",
	description = "Search and Rescue Gamemode in CSS & CS:GO",
	version = VERSION,
	url = "http://soldiersofdemise.com"
}


#include "OnPluginStart.sp"

#include "OnMapStart.sp"

#include "OnDogTagDistanceChanged.sp"
#include "OnConfigsExecuted.sp"
#include "OnEntityCreated.sp"


#include "Commands/Command_Spawn.sp"

#include "Events/Event_PlayerDeath.sp"
#include "Events/Event_RoundEnd.sp"

#include "functions.sp"

#include "Timers/Global.sp"


