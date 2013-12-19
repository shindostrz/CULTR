# app.directive "map", ->
#   map = L.map("map")
#   L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png",
#     attribution: "&copy; <a href=\"http://osm.org/copyright\">OpenStreetMap</a> contributors"
#   ).addTo map
#   map.locate
#     setView: true
#     maxZoom: 16

#   for index of $scope.convos
#     L.marker($scope.convos[index]).addTo(map).bindPopup "<strong>" + gon.topic[index] + "</strong><br>" + gon.description[index] + "<br><a href='/convos/" + [index] + "'>Go to convo</a>"
#   marker = undefined
#   map.on "click", (e) ->

#     # removes last marker if a new marker is dropped
#     if marker
#       map.removeLayer marker
#       marker = new L.Marker(e.latlng,
#         draggable: true
#       )
#       map.addLayer marker
#       new_convo_url = "<a href='/convos/new/?lat=" + e.latlng["lat"] + "&lng=" + e.latlng["lng"] + "'>" + "Start a new convo here</a>"
#       marker.bindPopup(new_convo_url).addTo(map).openPopup()
#     else
#       marker = new L.Marker(e.latlng,
#         draggable: true
#       )
#       map.addLayer marker
#       new_convo_url = "<a href='/convos/new/?lat=" + e.latlng["lat"] + "&lng=" + e.latlng["lng"] + "'>" + "Start a new convo here</a>"
#       marker.bindPopup(new_convo_url).addTo(map).openPopup()

#     # makes marker draggable and opens a new popup
#     marker.on "dragend", (e) ->
#       new_convo_url = "<a href='/convos/new/?lat=" + e.target._latlng["lat"] + "&lng=" + e.target._latlng["lng"] + "'>" + "Start a new convo here</a>"
#       marker.bindPopup(new_convo_url).addTo(map).openPopup()