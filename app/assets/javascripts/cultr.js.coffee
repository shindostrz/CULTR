app = angular.module("cultr", ["ngResource", "ngRoute"])

app.factory "Convo", ($resource) ->
  $resource("/convos/:id", {id: "@id"}, {update: {method: "PUT"}})

@ConvoCtrl = ($scope, Convo) ->
  $scope.convos = Convo.query()
  # $scope.convos. (data)->
  # $scope.convos.$promise.then (data)->
  #   $scope.mapConvos = data
  #   console.log(data)
  # console.log("convos are ",  $scope.convos)

@DetailCtrl = ($scope, $routeParams) ->
  for convo in $scope.convos
    console.log "Now checking convo number " + convo.id
    if convo.id == parseInt($routeParams.id)
      $scope.convo = convo
  # $scope.convo = convos[$routeParams.id]

app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when("/", {controller: @ConvoCtrl, templateUrl: "/templates/convo_list.html"})
  $routeProvider.when("/view/:id", {controller: @DetailCtrl, templateUrl: "/templates/view_convo.html"})
])

app.directive "mapDiv", ()->
  (scope, element, attributes)->
     scope.convos.$promise.then (data)->
        @convos = data
        map = L.map("map")
        L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png",
          attribution: "&copy; <a href=\"http://osm.org/copyright\">OpenStreetMap</a> contributors"
          ).addTo map
        map.locate
          setView: true
          maxZoom: 16

        for index of @convos
          console.log(@convos)
          L.marker([@convos[index]["latitude"], @convos[index]["longitude"]]).addTo(map).bindPopup "<strong>" + @convos[index]["topic"] + "</strong><br>" + @convos[index]["description"] + "<br><a href='#/view/"
          # + @convos[index]["convo_id"] +"'>Go to convo</a>"
        marker = undefined
        map.on "click", (e) ->

          # removes last marker if a new marker is dropped
          if marker
            map.removeLayer marker
            marker = new L.Marker(e.latlng,
              draggable: true
            )
            map.addLayer marker
            new_convo_url = "<a href='/convos/new/?lat=" + e.latlng["lat"] + "&lng=" + e.latlng["lng"] + "'>" + "Start a new convo here</a>"
            marker.bindPopup(new_convo_url).addTo(map).openPopup()
          else
            marker = new L.Marker(e.latlng,
              draggable: true
            )
            map.addLayer marker
            new_convo_url = "<a href='/convos/new/?lat=" + e.latlng["lat"] + "&lng=" + e.latlng["lng"] + "'>" + "Start a new convo here</a>"
            marker.bindPopup(new_convo_url).addTo(map).openPopup()

          # makes marker draggable and opens a new popup
          marker.on "dragend", (e) ->
            new_convo_url = "<a href='/convos/new/?lat=" + e.target._latlng["lat"] + "&lng=" + e.target._latlng["lng"] + "'>" + "Start a new convo here</a>"
            marker.bindPopup(new_convo_url).addTo(map).openPopup()