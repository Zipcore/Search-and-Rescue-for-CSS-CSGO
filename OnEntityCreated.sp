public void OnEntityCreated(int entity, const char[] classname)
{
	if(StrEqual(classname,"hostage_entity") || StrEqual(classname,"func_hostage_rescue"))
	{
		AcceptEntityInput(entity,"Kill");
	}
}