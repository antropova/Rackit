$( document ).ready(function() {
  if ($("#map").length >= 1 ) {
    handler = Gmaps.build('Google'); //, builders: { Marker: CustomMarkerBuilder }

    handler.buildMap({ provider: {}, internal: {id: 'map'}}, 
      function(){
      var addedTogether = allMarkers.concat(allMarkersTwo);
      markers = handler.addMarkers(addedTogether);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
    });
  }
});
