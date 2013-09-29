<!-- For Google Map
<script src="http://maps.google.com/maps/api/js?v=3.2&sensor=false" type="text/javascript"></script>
-->
<g:javascript library="jquery" plugin="jquery" />
<g:javascript src="jquery.popeye-2.1.min.js" />
<script type="text/javascript" src="${resource(dir:'openlayers', file:'OpenLayers.js')}"></script>
<script defer="defer" type="text/javascript">

// Change this value to "" in the production environment
var geoserver_url = "";

var map;
var untiled_lines;
var untiled_artifacts;
// pink tile avoidance
OpenLayers.IMAGE_RELOAD_ATTEMPTS = 5;
// make OL compute scale according to WMS spec
OpenLayers.DOTS_PER_INCH = 25.4 / 0.28;

function init(){
    format = 'image/png';
    var utm36n = new OpenLayers.Projection("EPSG:32636");
    var mercator = new OpenLayers.Projection("EPSG:900913");
    var bounds = new OpenLayers.Bounds(
        ${params.minX}, ${params.minY},
        ${params.maxX}, ${params.maxY}
    ); //.transform(utm36n, mercator)
    var options = {
        controls: [],
        maxExtent: bounds,
        projection: utm36n,
        displayProjection: utm36n,
        units: 'm',
        allOverlays: true
    };
    map = new OpenLayers.Map('map', options);

    // setup layers

    untiled_lines = new OpenLayers.Layer.WMS(
        "calit2:${params.layer} lines", geoserver_url + "/geoserver/calit2/wms",
        {
            LAYERS: 'calit2:${params.layer}_l',
            STYLES: '',
            format: format,
            transparent: 'true'
        },
        {singleTile: true, ratio: 1, isBaseLayer: false}
    );

    untiled_artifacts = new OpenLayers.Layer.WMS(
        "calit2:${params.layer} artifacts", geoserver_url + "/geoserver/calit2/wms",
        {
            LAYERS: 'calit2:${params.layer}_a',
            STYLES: '',
            format: format,
            transparent: 'true'
        },
        {singleTile: true, ratio: 1, isBaseLayer: false}
    );

    /*
    var gmap = new OpenLayers.Layer.Google(
        "Google Map",
        {
            type: google.maps.MapTypeId.TERRAIN,
            sphericalMercator: true,
            maxExtent: bounds,
            visibility: true
        }
    );
    */
    //var osm = new OpenLayers.Layer.OSM("Open Street Map");

    map.addLayers([untiled_lines, untiled_artifacts]);
    for (i = 1; i < map.layers.length; i++) {
        map.layers[i].setOpacity(0.5);
    }

    // build up all controls
    //map.addControl(new OpenLayers.Control.LayerSwitcher());
    map.addControl(new OpenLayers.Control.PanZoomBar({
        position: new OpenLayers.Pixel(2, 15)
    }));
    map.addControl(new OpenLayers.Control.Navigation());
    map.addControl(new OpenLayers.Control.Scale($('scale')));
    map.addControl(new OpenLayers.Control.MousePosition({element: $('location')}));
    map.zoomToExtent(bounds);

    // support GetFeatureInfo
    map.events.register('click', map, function (e) {
        document.getElementById('nodelist').innerHTML = "Loading... please wait...";
        var params = {
            REQUEST: "GetFeatureInfo",
            EXCEPTIONS: "application/vnd.ogc.se_xml",
            BBOX: map.getExtent().toBBOX(),
            SERVICE: "WMS",
            INFO_FORMAT: 'text/html',
            QUERY_LAYERS: map.baseLayer.params.LAYERS,
            FEATURE_COUNT: 50,
            Layers: map.baseLayer.params.LAYERS,
            WIDTH: map.size.w,
            HEIGHT: map.size.h,
            format: format,
            styles: map.baseLayer.params.STYLES,
            srs: map.baseLayer.params.SRS};

        // handle the wms 1.3 vs wms 1.1 madness
        if(map.baseLayer.params.VERSION == "1.3.0") {
            params.version = "1.3.0";
            params.j = Math.floor(e.xy.x);
            params.i = Math.floor(e.xy.y);
        } else {
            params.version = "1.1.1";
            params.x = Math.floor(e.xy.x);
            params.y = Math.floor(e.xy.y);
        }

        // merge filters
        if(map.baseLayer.params.CQL_FILTER != null) {
            params.cql_filter = map.baseLayer.params.CQL_FILTER;
        }
        if(map.baseLayer.params.FILTER != null) {
            params.filter = map.baseLayer.params.FILTER;
        }
        if(map.baseLayer.params.FEATUREID) {
            params.featureid = map.baseLayer.params.FEATUREID;
        }
        OpenLayers.loadURL(geoserver_url + "/geoserver/calit2/wms", params, this, setHTML, setHTML);
        OpenLayers.Event.stop(e);
    });
}

// sets the HTML provided into the nodelist element
function setHTML(response){
    document.getElementById('nodelist').innerHTML = response.responseText;
};

function setWidth(size){
    var mapDiv = document.getElementById('map');
    var wrapper = document.getElementById('wrapper');

    if (size == "auto") {
        // reset back to the default value
        mapDiv.style.width = null;
        wrapper.style.width = null;
    }
    else {
        mapDiv.style.width = size + "px";
        wrapper.style.width = size + "px";
    }
    // notify OL that we changed the size of the map div
    map.updateSize();
}

function setHeight(size){
    var mapDiv = document.getElementById('map');

    if (size == "auto") {
        // reset back to the default value
        mapDiv.style.height = null;
    }
    else {
        mapDiv.style.height = size + "px";
    }
    // notify OL that we changed the size of the map div
    map.updateSize();
}

function updateFilter(){
    var filterType = document.getElementById('filterType').value;
    var filter = document.getElementById('filter').value;

    // by default, reset all filters
    var filterParams = {
        filter: null,
        cql_filter: null,
        featureId: null
    };
    if (OpenLayers.String.trim(filter) != "") {
        if (filterType == "cql")
            filterParams["cql_filter"] = filter;
        if (filterType == "ogc")
            filterParams["filter"] = filter;
        if (filterType == "fid")
            filterParams["featureId"] = filter;
    }
    // merge the new filter definitions
    mergeNewParams(filterParams);
}

function resetFilter() {
    document.getElementById('filter').value = "";
    document.getElementById('locus').value = "";
    document.getElementById('basket').value = "";
    document.getElementById('stratum').value = "";
    updateFilter();
}

function mergeNewParams(params){
    untiled_lines.mergeNewParams(params);
    untiled_artifacts.mergeNewParams(params);
}

// Switch artifacts/lines as a base layer
function setLayer(layer){
   if (layer == 'artifacts') {
        untiled_artifacts.setOpacity(1.0);
        untiled_lines.setOpacity(0.25);
        map.setLayerIndex(untiled_artifacts, 0);
    }
    else {
        untiled_artifacts.setOpacity(0.25);
        untiled_lines.setOpacity(1.0);
        map.setLayerIndex(untiled_lines, 0);
    }
}

function updateFilterParams(){
    var filterParams = {
        filter: null,
        cql_filter: null,
        featureId: null
    };
    var locus = document.getElementById('locus').value;
    var basket = document.getElementById('basket').value;
    var stratum = document.getElementById('stratum').value;
    var query = '';
    if (locus) {
        query = 'locus=' + locus;
    }
    if (basket) {
        if (query) {
            query += ' and basket=' + basket;
        } else {
            query = 'basket=' + basket;
        }
    }
    if (stratum) {
        if (query) {
            query += ' and stratum=' + stratum;
        } else {
            query = 'stratum=' + stratum;
        }
    }
    if (!query) {
        resetFilter();
        return;
    }
    filterParams["cql_filter"] = query;
    mergeNewParams(filterParams);
}

function showPhotos(site, locus, basket) {
    $.ajax({
        url: '../photoThumbnail/getImages',
        data: {site: site, locus: locus, basket: basket},
        success: function(data) {
            $('#ppy1').html(data);
            $('#ppy1').popeye({caption: false, direction: 'left'});
        }
    });
}

</script>
