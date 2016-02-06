<#import "/spring.ftl" as spring/>
<#--<#assign s=JspTaglibs["http://www.springframework.org/tags"] />-->
<#assign s=JspTaglibs["/META-INF/spring.tld"] />

<#--&lt;#&ndash;<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>&ndash;&gt;-->
<#--<#assign sec=JspTaglibs["/META-INF/security.tld"] />-->


<#macro page_head>
<title>${title}</title>
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/login.css">

<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400,700,400italic,700italic'
      rel='stylesheet' type='text/css'>
</#macro>

<#macro page_body>
<h1>Basic Page</h1>
<p>This is the body of the page!</p>
</#macro>

<#macro display_page>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <@page_head/>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${s.mvcUrl("IC#index").build()}">JobMatch</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <#if auth.principal?? && auth.principal?is_hash && auth.principal.enabled>
                        <li><a href="/logout">Logout</a></li>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>

    <#if errors??>
        <div class="alert alert-danger fade in">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <#list errors as error>
                <li>${error}</li>
            </#list>
        </div>
    </#if>

    <@page_body/>

</div><!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
</body>
</html>
</#macro>