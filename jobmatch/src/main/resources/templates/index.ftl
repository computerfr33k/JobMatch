<#include "authentication-base.ftl">

<#macro header>LOGIN</#macro>

<#macro auth_page_body>
<form action="/login" name="user" method="post" class="form form-login">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="form-group">
        <input id="login-username" name="username" type="text" class="form-input form-control" placeholder="Username"
               required/>
    </div>
    <div class="form-group">
        <input id="login-password" name="password" type="password" class="form-input form-control"
               placeholder="Password" required/>
    </div>
    <div class="form-group">
        <button type="submit" class="btn login-btn">Login</button>
    </div>
    <div class="clear"></div>
</form>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <a href="#" class="forgot-password">Forgot your password?</a>
        <button type="button" class="btn register-button" onclick="parent.location='/register'">Register</button>
    </div>
</div>
</#macro>
<@display_page/>