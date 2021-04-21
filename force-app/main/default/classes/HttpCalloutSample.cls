public class HttpCalloutSample {
 
  // Pass in the endpoint to be used using the string url
  public static void getCalloutResponseContents() {
 
    // Instantiate a new http object
    Http h = new Http();
 
     // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    req.setMethod('GET');
 
    // Send the request, and return a response
    HttpResponse res = h.send(req);
   
    System.debug('res==='+res.getBody());
  //String animalsInfo= (String) System.JSON.deserialize(res.getBody(), JSON2Apex.class);
   
  }
  
  public class JSON2Apex {

    public List<String> animals;
       
    }
}