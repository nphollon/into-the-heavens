var http = require("http");
var fs = require("fs");

var port = 8090;
var writeDir = "../public_html/data";
var readDir = "models";

var server = http.createServer(function (request, response) {
    if (request.method === "POST") {
        writeFile(request, response);
    } else {
        readFile(request, response);
    }
}).listen(port, function (error) {
    if (error) {
        console.log(error);
    } else {
        console.log("Listening on port " + port);
    }
});

var writeFile = function (request, response) {
    var body = [];
    var filename = writeDir + request.url;
    
    request.on("data", function(chunk) {
        body.push(chunk);
    }).on("end", function() {
        fs.writeFile(filename, Buffer.concat(body), { flag : "wx" }, function (error) {
            if (error) {
                console.log("Failed to write file " + filename);
                console.log(error);
                response.writeHead(500, { "Access-Control-Allow-Origin": "*" });
                response.end();
            } else {
                response.writeHead(204, { "Access-Control-Allow-Origin": "*" });
                response.end();
            }
        });
    });
};

var readFile = function (request, response) {
    var filename = readDir + request.url;
    fs.readFile(filename, function (error, text) {
        if (error) {
            console.log("Failed to read file " + filename);
            console.log(error);
            response.writeHead(404, { "Access-Control-Allow-Origin": "*" });
            response.end();
        } else {
            response.writeHead(200, { "Access-Control-Allow-Origin": "*" });
            response.write(text);
            response.end();
        }
    });
};
