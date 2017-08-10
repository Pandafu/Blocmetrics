== README
```
//Put this in the application.js of the site you want tracked

var blocmetrics = {};
blocmetrics.report = function(eventName){
//creates an event JSON object to send to the Blocmetrics analytics service.
  var event = {event: { name: eventName }};
//initializes a new XMLHttpRequest() (AJAX request)
  var request = new XMLHttpRequest();
//sets the HTTP method to POST, the url of our events endpoint,
//and allow the request to run asynchronously.
  request.open("POST", "http://localhost:3000/api/events", true);
//set the request Content-Type header to 'application/json'. W/out that,
//our API::EventsController would not know how to process the request as JSON.
  request.setRequestHeader('Content-Type', 'application/json');
//send the request
  request.send(JSON.stringify(event));
  }

  //Put this in the view you want be tracked:
  blocmetrics.report("Name of event here");
```
