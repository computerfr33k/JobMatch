<#include "dashboard-base.ftl">

<#macro dashboard_nav>

</#macro>
<#macro dashboard_body>

<div class="jobs-list">
	<ul class="title-matches-list">

		<#list jobs as user>
			<li>
			${user.toString()}
				<a href="${s.mvcUrl("UC#delete").arg(0,user.id).build()}">delete</a>
			</li>
		</#list>

		<li>
			<div class="title">Job Title</div>
			<div class="matches">Matches: 6</div>
		</li>
		<li>
			<div class="title">Job Title</div>
			<div class="matches">Matches: 2</div>
		</li>
	</ul>
</div>

</#macro>

<@display_page />