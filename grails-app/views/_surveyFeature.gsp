<g:javascript library="jquery" plugin="jquery"/>
<script type="text/javascript">
    var options;
    $(document).ready(function() {
        var sfId = $('option.survey[selected="selected"]').val();
        options = $('option.survey').detach();
        showSurveys();
        if (sfId) {
            $('select#surveyFeature\\.id').val(sfId);
        }
    })
    $('select#site\\.id').change(function() {
        showSurveys();
    })
    var showSurveys = function() {
        $('option.survey').remove();
        options.appendTo('select#surveyFeature\\.id');
        var site = $('select#site\\.id').val();
        if (site && site != 'null') {
            $('option.survey[title!="site' + site + '"]').remove();
        }
    }
</script>

<select name="surveyFeature.id" id="surveyFeature.id" >
    <option value="null"></option>
<% net.calit2.archaeology.database.SurveyFeature.list().each { sf -> %>
    <g:if test="${sf.id == surveyFeatureId}">
    <option class="survey" title="site<%= sf.site?.id %>" value="<%= sf.id %>" selected="selected"><%= sf.toString() %></option>
    </g:if>
    <g:else>
    <option class="survey" title="site<%= sf.site?.id %>" value="<%= sf.id %>"><%= sf.toString() %></option>
    </g:else>
<% } %>
</select>