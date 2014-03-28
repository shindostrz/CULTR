window.onload = function () {

        var map = L.map('map');
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        map.locate({setView: true, maxZoom: 16});

        for (var index in gon.coordinates) {
          if (gon.coordinates[index][0]) {
          L.marker(gon.coordinates[index]).addTo(map).bindPopup("<strong>" + gon.category[index] + "</strong><br>" + gon.description[index] + "<br><a href='/convos/" + [index] + "'>Go to convo</a>");
        }
        };

  var marker;
        map.on('click', function(e){
          new_convo_url ="<a href='users/" + gon.current_user.id +"/convos/new/?lat=" + e.latlng["lat"] + "&lng=" +e.latlng["lng"] + "'>" + "Start a new convo here</a>";
          // removes last marker if a new marker is dropped
          if (marker) {
            map.removeLayer(marker);
            marker = new L.Marker(e.latlng, {draggable:true});
            map.addLayer(marker);
            marker.bindPopup(new_convo_url).addTo(map).openPopup();
          } else {
            marker = new L.Marker(e.latlng, {draggable:true});
            map.addLayer(marker);
            marker.bindPopup(new_convo_url).addTo(map).openPopup();
          }

        // makes marker draggable and opens a new popup
        marker.on('dragend', function(e) {
          new_convo_url ="<a href='/convos/new/?lat=" + e.target._latlng["lat"] + "&lng=" +e.target._latlng["lng"] + "'>" + "Start a new convo here</a>";
          marker.bindPopup(new_convo_url).addTo(map).openPopup();
        });
    });
}