<div id="search">
  <g:form url="/archaeology/searchable"
          id="searchableForm"
          name="searchableForm"
          method="get">
    <g:textField name="q" value="${params.q}" />
    <input type="submit" value="Search" />
  </g:form>
</div>