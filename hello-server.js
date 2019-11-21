// Build a server with Node's HTTP module
const http = require('http');
const port = 3001;
const server = http.createServer();

server.on('request', (request, response) => {
    console.log(`URL: ${request.url}`);
    response.end('Ahuevo, funciono!')
})

//Start the server
server.listen(port, (error)=>{
    if(error) return console.log(`Error: ${error}`)
    
    console.log(`Server is listening on port ${port}`)
})