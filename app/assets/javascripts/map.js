$( document ).ready(function() {

  if ($("#map").length >= 1 ) {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers(allMarkers);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  }
});
