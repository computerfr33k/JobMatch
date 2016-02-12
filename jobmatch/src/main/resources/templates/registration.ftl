<#include "authentication-base.ftl">

<#macro header>REGISTER</#macro>

<#macro auth_page_body>
<form action="" method="post" class="form form-login form-register">
    <div class="form-field">
        <div class="radio-button">
            <input type="radio" name="user-type" id="employer" value="employer" checked>
            <label for="employer">Employer</label>
        </div>
        <div class="radio-button">
            <input type="radio" name="user-type" id="job-seeker" value="job-seeker">
            <label for="job-seeker">Job Seeker</label>
        </div>
    </div>
    <div class="form-field">
        <input id="login-username" type="text" class="form-input" placeholder="Email" required>
    </div>
    <div class="form-field">
        <input id="login-password" type="password" class="form-input" placeholder="Password" required>
    </div>
    <div class="form-field">
        <input id="login-confirm" type="password" class="form-input" placeholder="Confirm password" required>
    </div>
    <div class="form-field">
        <input type="submit" value="create my account">
    </div>
    <div class="clear"></div>
</form>

<div class="form-text">
    <p><a href="#" class="forgot-password">&lt; Back to login page</a></p>
</div>
</#macro>
<@display_page/>