<#include "authentication-base.ftl">

<#macro header>REGISTER</#macro>

<#macro auth_page_body>
<form action="/register" name="user" method="post" class="form form-login">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="form-group">
        <input id="username" name="username" type="text" class="form-control" placeholder="Username" required/>
    </div>

    <div class="form-group">
        <input id="password" name="password" type="password" class="form-control" placeholder="Password" required/>
    </div>

    <!-- Start Contact Model Input -->
    <div class="form-group">
        <input id="firstName" name="contact.firstName" type="text" class="form-control" placeholder="First Name"
               required/>
    </div>

    <div class="form-group">
        <input id="lastName" name="contact.lastName" type="text" class="form-control" placeholder="Last Name" required/>
    </div>

    <div class="form-group">
        <input id="email" name="contact.email" type="email" class="form-control" placeholder="Email" required/>
    </div>

    <div class="form-group">
        <input id="phone" name="contact.phone" type="tel" class="form-control" placeholder="Phone Number" required/>
    </div>

    <div class="form-group">
        <input id="address" name="contact.address" type="text" class="form-control" placeholder="Address" required/>
    </div>

    <div class="form-group">
        <input id="zipcode" name="contact.zipcode" type="number" class="form-control" placeholder="ZipCode" required/>
    </div>

    <div class="form-group">
        <input id="website" name="contact.website" type="url" class="form-control" placeholder="Website"/>
    </div>
    <!-- End Contact Model Input -->

    <div class="checkbox">
        <label>
            <input id="optIn" name="optIn" type="checkbox"> Opt In
        </label>
    </div>

    <div class="form-group">
        <button type="submit" class="btn login-btn">Register</button>
    </div>
    <div class="clear"></div>
</form>
<div class="form-text">
    <p>
        <a href="/" class="forgot-password">Already Have An Account? Login Here</a>
    </p>
</div>

</#macro>
<@display_page/>