<#include "../base.ftl">


<#macro page_body>
  <h1>Users</h1>
  <ul>
	<#list users as user>
		<li>${user.toString()}</li>
	</#list>
  </ul>
</#macro>

<@display_page/>