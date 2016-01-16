<cfscript>
if (structKeyExists(session, "user"))
{
	location("/letweknowu");
}
else
{
	location("/basics");
};
</cfscript>