const express = require('express')  
const httpProxy = require('express-http-proxy')  
const app = express()

const userServiceProxy = httpProxy(process.env.USERS_URL || 'http://localhost:8888')
const fruitsServiceProxy = httpProxy(process.env.FRUITS_URL || 'http://localhost:9999')

// Authentication
app.use((req, res, next) => {  
  // TODO: my authentication logic
  next()
})

// Proxy request
app.use()

app.all('/users*', (req, res, next) => {  
  userServiceProxy(req, res, next)
})
app.all('/fruits*', (req, res, next) => {  
  fruitsServiceProxy(req, res, next)
})

app.listen(process.env.PORT || 10000, function () {
  console.log('Gateway listening on port '+ (process.env.PORT || 10000));
});