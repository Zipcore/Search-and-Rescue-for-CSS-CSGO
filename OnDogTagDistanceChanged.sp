public void OnDogTagDistanceChanged(ConVar convar, const char[] oldValue, const char[] newValue)
{
	if(convar == sm_sar_dogtag_distance)
	{
		DogTagDistance = StringToInt(newValue);
	}
}