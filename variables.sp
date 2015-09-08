int DogTagActive[MAXPLAYERS+1];
int DogTagTeam[MAXPLAYERS+1];
float DogTagPos[MAXPLAYERS+1][3];
bool RoundActive = false;
bool CanRespawn[MAXPLAYERS+1];

int DogTagDistance = 128; // setting to default value


// TEMP ENTS
int RedGlow;


ConVar sm_sar_dogtag_time = null;
ConVar sm_sar_dogtag_distance = null;