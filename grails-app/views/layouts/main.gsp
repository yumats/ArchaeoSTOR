<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <!--
        <g:render template="/layouts/search" />
        -->
        <div id="grailsLogo"><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'logo.png')}" alt="Logo" border="0" /></a></div>
        <g:layoutBody />
    </body>
</html>