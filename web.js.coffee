express = require 'express'

app = express.createServer express.logger()

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.compiler({ src: __dirname + '/public', enable: ['less'] })
  app.use app.router
  app.use express.static(__dirname + '/public')

app.get '/', (req, res) ->
    locals = {message: 'Express + Haml!!!!'}
    res.render('index', {locals: locals})

port = process.env.PORT || 3000
app.listen port, ->
  console.log "Listening on " + port