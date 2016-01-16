<cfcomponent name="Application">

	<cfscript>
		this.Name = "cadastro_xpto";

		this.applicationTimeout = createTimespan(1, 2, 0, 0);
		this.sessionTimeout = createTimespan(0, 4, 0, 0);
		this.sessionManagement = true;
		this.setClientCookies = true;
	</cfscript>

</cfcomponent>
