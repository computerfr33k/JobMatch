<#include "../dashboard-base.ftl">

<#macro dashboard_nav>
<li><a href="#">Jobs</a></li>
</#macro>
<#macro dashboard_body>


${job.jobTitle}
${job.jobCountry}
${job.industry}
${job.jobType}
${job.yearsExperience}

<p>Skills:</p>
<ul>
	<#list job.skills as skill>
		<li>${skill.name}</li>
	<#else>
		No skills
	</#list>
</ul>
<a class="sidebar-button" href="${s.mvcUrl("JC#deleteJob").arg(0,job.id).build()}">Delete</a>
<a class="sidebar-button" href="${s.mvcUrl("JC#updateJob").arg(0,job.id).build()}">Edit</a>

</#macro>

<@display_page />