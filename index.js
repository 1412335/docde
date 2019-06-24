var express = require('express');
var redis = require('redis');

var REDIS_HOST = 'redis', 
    REDIS_PORT = 6379;

var redisClient = redis.createClient({
  host: REDIS_HOST,
  port: REDIS_PORT
});
 
redisClient.on("error", function (err) {
    console.log("Error " + err);
});

redisClient.set("count", "0");

var PORT = process.env.PORT || 8080;

var app = express();

app.get('/', function (req, res) {
  redisClient.get("count", function(err, reply) {
    if (err) console.log(err);
    else {
      console.log(reply);
      try {
        reply = parseInt(reply) + 1;        
      } catch (error) {
        reply = 1;
      }
      redisClient.set("count", reply.toString());
      res.send('View ' + reply);
    }
  });
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);