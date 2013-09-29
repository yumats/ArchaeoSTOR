<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>OpenLayers map preview</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${resource(dir:'css', file:'main.css')}" type="text/css" />
        <link rel="stylesheet" href="${resource(dir:'openlayers/theme/default', file:'style.css')}" type="text/css" />
        <link rel="stylesheet" href="${resource(dir:'css', file:'map.css')}" type="text/css" />
        <link rel="stylesheet" href="${resource(dir:'css', file:'jquery.popeye.css')}" type="text/css" />
        <link rel="stylesheet" href="${resource(dir:'css', file:'jquery.popeye.style.css')}" type="text/css" />

        <g:render template="/map/mapScript" />

    </head>
    <body onload="init()">
        <div id="grailsLogo"><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'logo.png')}" alt="Logo" border="0" /></a></div>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <div id="toolbar" style="display: block; margin-top: 8px;">
                <ul>
                    <!--
                    <li>
                        <a>Width/Height:</a>
                        <select id="widthSelector" onchange="setWidth(value)">
                            <option value="auto">Auto</option>
                            <option value="600">600</option>
                            <option value="750">750</option>
                            <option value="950">950</option>
                            <option value="1000">1000</option>
                            <option value="1200">1200</option>
                            <option value="1400">1400</option>
                            <option value="1600">1600</option>
                            <option value="1900">1900</option>
                        </select>
                        <select id="heigthSelector" onchange="setHeight(value)">
                            <option value="auto">Auto</option>
                            <option value="300">300</option>
                            <option value="400">400</option>
                            <option value="500">500</option>
                            <option value="600">600</option>
                            <option value="700">700</option>
                            <option value="800">800</option>
                            <option value="900">900</option>
                            <option value="1000">1000</option>
                        </select>
                    </li>
                    -->
                    <li>
                        <a>Layer:</a>
                        <select id="layerSelector" onchange="setLayer(value)">
                            <option value="artifacts">Artifacts</option>
                            <option value="lines" selected="selected">Lines</option>
                        </select>
                    </li>
                    <li><a>Locus:</a><input type="text" size="8" id="locus" style="margin-left:3px" onkeyup="updateFilterParams()"/></li>
                    <li><a>Basket:</a><input type="text" size="8" id="basket" style="margin-left:3px" onkeyup="updateFilterParams()"/></li>
                    <li><a>Stratum:</a><input type="text" size="8" id="stratum" style="margin-left:3px" onkeyup="updateFilterParams()"/></li>
                    <li>
                        <a>Filter:</a>
                        <select id="filterType">
                            <option value="cql">CQL</option>
                            <option value="ogc">OGC</option>
                            <option value="fid">FeatureID</option>
                        </select>
                        <input type="text" size="50" id="filter"/>
                        <img id="updateFilterButton" src="/archaeology/openlayers/img/east-mini.png" onClick="updateFilter()" title="Apply filter"/>
                        <img id="resetFilterButton" src="/archaeology/openlayers/img/cancel.png" onClick="resetFilter()" title="Reset filter"/>
                    </li>
                </ul>
            </div>

            <div id="map" style="float:left">
            </div>
            <div class="ppy" id="ppy1" style="float:left; margin-top:100px; margin-left:75px">
            </div>
            <div id="wrapper">
                <div id="location">location</div>
                <div id="scale">
                </div>
            </div>

            <div id="nodelist" style="clear:both">
                <em>Click on the map to get feature info</em>
            </div>
        </div>
    </body>
</html>
