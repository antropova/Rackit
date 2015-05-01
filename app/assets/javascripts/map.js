$( document ).ready(function() {

  if ($("#map").length >= 1 ) {

   handler = Gmaps.build('Google',{ markers: { clusterer: {gridSize: 60, maxZoom: 30} } }); //, builders: { Marker: CustomMarkerBuilder }


    handler.buildMap({
      provider: {},
      internal: {id: 'map'}
    },
     function(){

      var addedTogether = allMarkers.concat(allMarkersTwo);
      markers = handler.addMarkers(addedTogether);
      
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
    });
  }
