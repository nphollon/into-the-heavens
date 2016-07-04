var http = require('http');
var fs = require('fs');

var server = http.createServer(function (request, response) {
    if (request.method === 'POST') {
        var body = [];
        var filename = "public_html/data" + request.url;
        
        request.on('data', function(chunk) {
            body.push(chunk);
        }).on('end', function() {
            fs.writeFile(filename,
                         Buffer.concat(body),
                         { flag : "wx" },
                         function (error) {
                if (error) {
                    console.log("Failed to write file " + filename);
                    console.log(error);
                    response.writeHead(500);
                    response.end();
                } else {
                    response.writeHead(204);
                    response.end();
                }
            });
        });
    } else {
        response.writeHead(404);
        response.end();
    }
}).listen(8090);
