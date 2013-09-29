<html>
    <head>
        <title>ArchaeoSTOR - Digital Archaeology DB</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">
        #nav {
            margin-top:5px;
            margin-left:30px;
            width:228px;
            float:left;
        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.2em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(/archaeology/images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(/archaeology/images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }
        .homePagePanel .panelTop {
            background: url(/archaeology/images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:20px;
            margin-bottom:20px;
            font-size:1.2em;
            padding-left: 10px;
            padding-bottom: 2px;
            border-left: 10px solid #eeeeee;
            border-bottom: 2px dotted #eeeeee;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
            margin-bottom:20px;
        }
        table {
            border-width: 0px;
            width: 720px;
        }
        td {
            padding-left: 10px;
            width: 50%;
        }
        ul {
            list-style-type: none;
        }
        li {
            background-image: url(/archaeology/images/circle.png);
            background-repeat: no-repeat;
            background-position: 0 0.25em;
            padding-left: 1.2em;
            font-size: 1.1em;
            margin-bottom: 4px;
        }
        </style>

        <g:javascript library="jquery" plugin="jquery"/>
        <script type="text/javascript">
            $(document).ready(function(){
                $('ul.artifact').hide();
                var current = $('select#artifact').val();
                if (current) {
                    $('ul#' + current).show();
                }
            });
            function showArtifactMenu(id) {
                $('ul.artifact').hide();
                if (id) {
                    $('ul#' + id).show();
                    $.ajax({
                        url: 'menu/saveSession',
                        data: {artifact: id}
                    });
                }
            }
        </script>

    </head>
    <body>

        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Tools</h1>
                    <br>
                    <h3>Inventory Control</h3>
                    <br>
                    <ul>
                        <li><g:link url="[action:'identify',controller:'artifact']">Find Artifact</g:link></li>
                        <li><g:link url="[action:'identify',controller:'diagnostic']">Find Diagnostic</g:link></li>
                        <li><g:link url="[action:'diagnose',controller:'artifact']">Find Associated Diagnostic</g:link></li>
                        <br>
                        <li><g:link url="[action:'crate',controller:'artifact']">Crate Artifact</g:link></li>
                        <br>
                        <li><g:link url="[action:'move',controller:'crate']">Move Crate in Field</g:link></li>
                        <li><g:link url="[action:'movesd',controller:'crate']">Move Crate in SD</g:link></li>
                        <br>
                        <li><g:link url="[action:'move',controller:'artifact']">Move Artifact in Field</g:link></li>
                        <li><g:link url="[action:'movesd',controller:'artifact']">Move Artifact in SD</g:link></li>
                    </ul>
                    <br>
                    <h3>Visual Analysis</h3>
                    <br>
                    <ul>
                        <g:each in="${net.calit2.archaeology.util.MapLink.list(sort:'layer', order:'asc')}">
                            <li><a href="/archaeology/map/renderMap?layer=${it.layer}&minX=${it.minX}&minY=${it.minY}&maxX=${it.maxX}&maxY=${it.maxY}">${it.layer}</a></li>
                        </g:each>
                        <br>
                        <li><g:link url="[action:'list',controller:'mapLink']">Manage Maps</g:link></li>
                        <li><a href="/geoserver/">GeoServer</a></li>
                        <li><g:link url="[action:'index',controller:'shapefile']">Shapefile</g:link></li>
                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>

        <div id="pageBody">
            <h1>ArchaeoSTOR - Digital Archaeology DB</h1>

            <table><tr><td colspan="2">
            <div class="dialog">
                <h2>Site</h2>
                <g:form controller="menu" action="index" style="margin-bottom:10px">
                    <g:select name="institution" from="${net.calit2.archaeology.database.Site.getInstitutions().sort()}" value="${session.institution}" noSelection="['':'INSTITUTION']" onChange="submit()"/>
                    <g:if test="${session.institution}">
                        <g:select name="site" from="${net.calit2.archaeology.database.Site.findAllByExcavationInstitution(session.institution, [sort:'name', order:'asc'])}" value="${session.site}" optionKey="id" noSelection="['':'ALL']" onChange="submit()"/>
                    </g:if>
                </g:form>
                <g:if test="${!(session.site)}">
                <ul>
                    <li><g:link url="[action:'create',controller:'site']">Create</g:link></li>
                    <li><g:link url="[action:'list',controller:'site']">Manage</g:link></li>
                </ul>
                </g:if>
            </div>
            </td></tr>

            <tr><td>
            <div class="dialog">
                <h2>Survey Feature</h2>
                <ul>
                    <li><g:link url="[action:'create',controller:'surveyFeature',params:['site.id': session.site]]">Create</g:link></li>
                    <li><g:link url="[action:'list',controller:'surveyFeature']">Manage</g:link></li>
                </ul>
            </div>

            <div class="dialog">
                <h2>Crate</h2>
                <ul>
                    <li><g:link url="[action:'create',controller:'crate',params:['site.id': session.site]]">Create</g:link></li>
                    <li><g:link url="[action:'list',controller:'crate']">Manage</g:link></li>
                    <li><g:link url="[action:'report',controller:'crate']">Report</g:link></li>
                </ul>
            </div>

            <div class="dialog">
                <h2>Photos</h2>
                <ul>
                    <li><g:link url="[action:'create',controller:'photoThumbnail']">Import</g:link></li>
                    <li><g:link url="[action:'list',controller:'photoThumbnail']">Manage</g:link></li>
                </ul>
            </div>
            </td>

            <td>
            <div class="dialog">
                <h2>Artifact Bulk/Diagnostic</h2>
                <g:select name="artifact" value="${session.artifact}" from="${net.calit2.archaeology.database.Constants.D_CODE.keySet() as List}" style="margin-bottom:10px" onChange="showArtifactMenu(this.value)"/>
                <ul id="Bead" class="artifact">
                    <li><g:link url="[action:'create',controller:'beadBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'beadBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Bone" class="artifact">
                    <li><g:link url="[action:'create',controller:'boneBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'boneBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="ChemistrySample" class="artifact">
                    <li><g:link url="[action:'create',controller:'chemistrySample',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'chemistrySample']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Coin" class="artifact">
                    <li><g:link url="[action:'create',controller:'coinBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'coinBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Figurine" class="artifact">
                    <li><g:link url="[action:'create',controller:'figurineBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'figurineBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="FloatationSample" class="artifact">
                    <li><g:link url="[action:'create',controller:'floatationSample',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'floatationSample']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Glass" class="artifact">
                    <li><g:link url="[action:'create',controller:'glassBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'glassBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="GroundStone" class="artifact">
                    <li><g:link url="[action:'create',controller:'groundStoneBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'groundStoneBulk']">Manage Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'groundStoneDiagnostic']">Manage Diagnostic</g:link></li>
                </ul>
                <ul id="Lithics" class="artifact">
                    <li><g:link url="[action:'create',controller:'lithicsBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'lithicsBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Metal" class="artifact">
                    <li><g:link url="[action:'create',controller:'metalBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'metalBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Ore" class="artifact">
                    <li><g:link url="[action:'create',controller:'oreBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'oreBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Organic" class="artifact">
                    <li><g:link url="[action:'create',controller:'organicBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'organicBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Other" class="artifact">
                    <li><g:link url="[action:'create',controller:'otherBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'otherBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Pottery" class="artifact">
                    <li><g:link url="[action:'create',controller:'potteryBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'potteryBulk']">Manage Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'potteryDiagnostic']">Manage Diagnostic</g:link></li>
                </ul>
                <ul id="RadioCarbon" class="artifact">
                    <li><g:link url="[action:'create',controller:'radioCarbonBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'radioCarbonBulk']">Manage Bulk</g:link></li>
                    <li><g:link url="[action:'create',controller:'radioCarbonDiagnostic']">Create Diagnostic</g:link></li>
                    <li><g:link url="[action:'list',controller:'radioCarbonDiagnostic']">Manage Diagnostic</g:link></li>
                    <li><g:link url="[action:'imports',controller:'radioCarbonDiagnostic']">Import Output File</g:link></li>
                </ul>
                <ul id="Shell" class="artifact">
                    <li><g:link url="[action:'create',controller:'shellBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'shellBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Slag" class="artifact">
                    <li><g:link url="[action:'create',controller:'slagBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'slagBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="TechnologicalCeramics" class="artifact">
                    <li><g:link url="[action:'create',controller:'technologicalCeramicsBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'technologicalCeramicsBulk']">Manage Bulk</g:link></li>
                </ul>
                <ul id="Textile" class="artifact">
                    <li><g:link url="[action:'create',controller:'textileBulk',params:['site.id': session.site]]">Create Bulk</g:link></li>
                    <li><g:link url="[action:'list',controller:'textileBulk']">Manage Bulk</g:link></li>
                </ul>
            </div>

            <div class="dialog">
                <h2>Artifact Analysis</h2>
                <ul>
                    <li><g:link url="[action:'list',controller:'artifact']">Manage</g:link></li>
                    <!--
                    <li><g:link url="[action:'search',controller:'artifact',params:['site.id': session.site]]">Search</g:link></li>
                    -->
                </ul>
            </div>

            <div class="dialog">
                <h2>Diagnostic Basics</h2>
                <ul>
                    <li><g:link url="[action:'create',controller:'diagnostic']">Create</g:link></li>
                    <li><g:link url="[action:'list',controller:'diagnostic']">Manage</g:link></li>
                    <!--
                    <li><g:link url="[action:'search',controller:'diagnostic']">Search</g:link></li>
                    -->
                </ul>
            </div>

            <div class="dialog">
                <h2>Diagnostic Measurement</h2>
                <ul>
                    <li><g:link url="[action:'create',controller:'xrfRaw']">Import XRF</g:link></li>
				    <li><g:link url="[action:'list',controller:'xrfRaw']">Manage XRF</g:link></li>
                    <br>
                    <li><g:link url="[action:'create',controller:'ftirRaw']">Import FTIR</g:link></li>
                    <li><g:link url="[action:'list',controller:'ftirRaw']">Manage FTIR</g:link></li>
                </ul>
            </div>
            </td></tr></table>

        </div>
    </body>
</html>
