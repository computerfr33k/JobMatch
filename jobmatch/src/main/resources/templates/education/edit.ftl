<#include "../dashboard-base.ftl">

<#macro header>EDUCATION</#macro>

<#macro dashboard_body>
<form action="${s.mvcUrl("EC#updateEducation").arg(0, user.id).arg(1, education.id).build()}" method="post"
      name="education">
    <@spring.bind "education"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <table id="t1" align="center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
        <thead>
        <tr>
            <th class="mdl-data-table__cell--non-numeric"><h5>Education</h5></th>
            <th class="mdl-data-table__cell--non-numeric"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="mdl-data-table__cell--non-numeric"><h6>School Name:</h6></td>
            <td class="mdl-data-table__cell--non-numeric">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="text" id="schoolName" name="schoolName" required
                           <#if education.schoolName??>value="${education.schoolName}" </#if>>
                    <label class="mdl-textfield__label" for="schoolName">DePaul University</label>
                </div>
            </td>
        </tr>
        <tr>
            <td class="mdl-data-table__cell--non-numeric"><h6>Country:</h6></td>
            <td class="mdl-data-table__cell--non-numeric">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="text" id="country" name="country" required
                           <#if education.country??>value="${education.country}" </#if>>
                    <label class="mdl-textfield__label" for="country">United States</label>
                </div>
            </td>
        </tr>
        <tr>
            <td class="mdl-data-table__cell--non-numeric"><h6>Degree:</h6></td>
            <td class="mdl-data-table__cell--non-numeric">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="text" id="degree" name="degree" required
                           <#if education.degree??>value="${education.degree}" </#if>>
                    <label class="mdl-textfield__label" for="degree">Bachelor of Science</label>
                </div>
            </td>
        </tr>
        <tr>
            <td class="mdl-data-table__cell--non-numeric"><h6>Major:</h6></td>
            <td class="mdl-data-table__cell--non-numeric">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="text" id="major" name="major" required
                           <#if education.major??>value="${education.major}" </#if>>
                    <label class="mdl-textfield__label" for="major">Computer Science</label>
                </div>
            </td>
        </tr>
        <tr>
            <td class="mdl-data-table__cell--non-numeric"><h6>Year Graduated:</h6></td>
            <td class="mdl-data-table__cell--non-numeric">
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="number" id="yearGraduated" name="yearGraduated"
                           required <#if education.yearGraduated??>value="${education.yearGraduated}" </#if>>
                    <label class="mdl-textfield__label" for="yearGraduated">2016</label>
                </div>
            </td>
        </tr>
        <th colspan="2">
            <input type="submit" value="Save"/>
        </th>
        </tbody>
    </table>
</form>
<br/>
</#macro>
<@display_page/>