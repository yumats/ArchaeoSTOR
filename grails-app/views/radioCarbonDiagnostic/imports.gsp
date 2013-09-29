<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic')}" />
    <style type="text/css" media="screen">
        input {
        margin-right: 10px;
        padding-top: 10px;
        padding-bottom: 10px;
        }
    </style>
    <title>Import RadioCarbon Output File</title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
</div>
<div class="body">
    <h1>Import RadioCarbon Output File</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:uploadForm name="rcUpload" action="upload">
        <div class="dialog">
            <table>
                <tr><td style="padding-top:20px">CSV file</td><td><input type="file" name="content"/></td></tr>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:submitButton name="upload" class="upload" value="Upload" /></span>
        </div>
    </g:uploadForm>
</div>
</body>
</html>
