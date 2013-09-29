
<%@ page import="net.calit2.archaeology.database.RadioCarbonDiagnostic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'radioCarbonDiagnostic.label', default: 'RadioCarbonDiagnostic')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="quickedit.js" />
        <script type="text/javascript">
            var artifactType = 'radioCarbonDiagnostic';
            $(function() {
                var toggle = $('input#toggleBox');
                toggle.change(function() {
                    if (toggle.attr('checked')) {
                        $('input.checkBox').attr('checked', true);
                    } else {
                        $('input.checkBox').attr('checked', false);
                    }
                });
            });
        </script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="upload" action="imports">Import Output</g:link></span>
            <span class="menuButton"><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form method="post" >
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <th><input type="checkBox" name="toggleBox" id="toggleBox" /></th>

                            <g:sortableColumn property="id" title="${message(code: 'radioCarbonDiagnostic.id.label', default: 'Id')}" />

                            <th>Year</th>
                            <th>Site</th>
                            <th>Feature</th>
                            <th>EDM</th>
                            <th>Basket</th>
                            <th>Locus</th>
                        
                            <g:sortableColumn property="labNumber" title="${message(code: 'radioCarbonDiagnostic.labNumber.label', default: 'Lab Number')}" />
                        
                            <g:sortableColumn property="sampleMaterial" title="${message(code: 'radioCarbonDiagnostic.sampleMaterial.label', default: 'Sample Material')}" />
                        
                            <g:sortableColumn property="species" title="${message(code: 'radioCarbonDiagnostic.species.label', default: 'Species')}" />
                        
                            <g:sortableColumn property="dateBp" title="${message(code: 'radioCarbonDiagnostic.dateBp.label', default: 'Date Bp')}" />
                        
                            <g:sortableColumn property="uncertainty" title="${message(code: 'radioCarbonDiagnostic.uncertainty.label', default: 'Uncertainty')}" />

                            <g:sortableColumn property="timestamp" title="${message(code: 'radioCarbonDiagnostic.timestamp.label', default: 'Timestamp')}" />

                            <g:sortableColumn property="unmodelledOneSigFrom" title="${message(code: 'radioCarbonDiagnostic.unmodelledOneSigFrom.label', default: 'OneSig From')}" />

                            <g:sortableColumn property="unmodelledOneSigTo" title="${message(code: 'radioCarbonDiagnostic.unmodelledOneSigTo.label', default: 'OneSig To')}" />

                            <g:sortableColumn property="unmodelledTwoSigFrom" title="${message(code: 'radioCarbonDiagnostic.unmodelledTwoSigFrom.label', default: 'TwoSig From')}" />

                            <g:sortableColumn property="unmodelledTwoSigTo" title="${message(code: 'radioCarbonDiagnostic.unmodelledTwoSigTo.label', default: 'TwoSig To')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${radioCarbonDiagnosticInstanceList}" status="i" var="radioCarbonDiagnosticInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:checkBox class="checkBox" name="checkBox${radioCarbonDiagnosticInstance.id}" value="%22${radioCarbonDiagnosticInstance.labNumber}%22,${radioCarbonDiagnosticInstance.dateBp},${radioCarbonDiagnosticInstance.uncertainty}" checked="false" /></td>

                            <td><g:link action="edit" id="${radioCarbonDiagnosticInstance.id}">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "id")}</g:link></td>

                            <td>${radioCarbonDiagnosticInstance.artifact?.year}</td>
                            <td>${radioCarbonDiagnosticInstance.artifact?.site}</td>
                            <td>${radioCarbonDiagnosticInstance.artifact?.surveyFeature}</td>
                            <td>${radioCarbonDiagnosticInstance.artifact?.edm}</td>
                            <td>${radioCarbonDiagnosticInstance.artifact?.basket}</td>
                            <td>${radioCarbonDiagnosticInstance.artifact?.locus}</td>
                        
                            <td class="editable" data-id="${radioCarbonDiagnosticInstance.id}" data-field="labNumber">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "labNumber")}</td>
                        
                            <td class="editable" data-id="${radioCarbonDiagnosticInstance.id}" data-field="sampleMaterial">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "sampleMaterial")}</td>
                        
                            <td class="editable" data-id="${radioCarbonDiagnosticInstance.id}" data-field="species">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "species")}</td>
                        
                            <td class="editable" data-id="${radioCarbonDiagnosticInstance.id}" data-field="dateBp">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "dateBp")}</td>
                        
                            <td class="editable" data-id="${radioCarbonDiagnosticInstance.id}" data-field="uncertainty">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "uncertainty")}</td>

                            <td data-id="${radioCarbonDiagnosticInstance.id}" data-field="timestamp">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "timestamp")}</td>

                            <td data-id="${radioCarbonDiagnosticInstance.id}" data-field="unmodelledOneSigFrom">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledOneSigFrom")}</td>

                            <td data-id="${radioCarbonDiagnosticInstance.id}" data-field="unmodelledOneSigTo">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledOneSigTo")}</td>

                            <td data-id="${radioCarbonDiagnosticInstance.id}" data-field="unmodelledTwoSigFrom">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledTwoSigFrom")}</td>

                            <td data-id="${radioCarbonDiagnosticInstance.id}" data-field="unmodelledTwoSigTo">${fieldValue(bean: radioCarbonDiagnosticInstance, field: "unmodelledTwoSigTo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="${params.max}">
                <div class="paginateButtons">
                    <g:paginate total="${radioCarbonDiagnosticInstanceTotal}" />
                </div>
            </g:if>
            <div class="buttons">
                <span class="button"><g:actionSubmit class="upload" action="sendToOxcal" value="Send To OxCal" /></span>
            </div>
            </g:form>

            <h1>Export</h1>
            <export:formats formats="['csv', 'excel']" />
        </div>
    </body>
</html>
