$( document ).ready(function() {

  if ($("#map").length >= 1 ) {
   handler = Gmaps.build('Google',{ markers: { clusterer: {gridSize: 30, maxZoom: 30} } }); //, builders: { Marker: CustomMarkerBuilder }

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
});



// function createImage(url){
//   var image = {
//     url: url,
//     // This marker is 32 pixels wide by 32 pixels tall.
//     size: new google.maps.Size(32, 32),
//     // The origin for this image is 0,0.
//     origin: new google.maps.Point(0,0),
//     // The anchor for this image is the base of the flagpole at 0,32.
//     anchor: new google.maps.Point(0, 32)
//   };
//   return image;
// }

// function createCustomMarker(coords,map,title){
//   marker = new google.maps.Marker({
//     position: coords,
//     map: map,
//     title: title,
//     icon: createImage("/assets/bike_icon.png")
//   });
// }
