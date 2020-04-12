const http = require('http');
const { promisify } = require('util');
const exec = require('child_process').exec;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  exec('rm -rf /tmp/nginx-cache', (err, resp) => {
    if (err) {
      console.log(err);
      res.statusCode = 500;
      res.end('Nope');
    } else {
      console.log('cleared cache');
      res.end('cache cleared');
    }
  });
});

server.on('clientError', (err, socket) => {
  socket.end('HTTP/1.1 400 Bad Request');
});

server.listen(8289);
