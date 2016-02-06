<#include "base.ftl">

<#macro auth_page_body >
oops, you forgot to implement an auth_page_body in your template!
</#macro>

<#macro page_body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title"><span class="logo">JobMatch</span> | <@header/></h1>
                </div>
                <div class="panel-body">
                    <@auth_page_body/>
                </div>
            </div>
        </div>
    </div>
</div>
</#macro>
