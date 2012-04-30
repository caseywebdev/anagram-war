module.exports = ->
  @view 'index': ->
    doctype 5
    html ->
      head ->
        title 'PicoChat!'
        script src: '/underscore-min.js'
        script src: '/backbone-min.js'
        script src: '/socket.io/socket.io.js'
        script src: '/zappa/jquery.js'
        script src: '/zappa/zappa.js'
        script src: '/index.js'
        script src: '/user.js'
      body ->
        div id: 'panel'
        form ->
          input id: 'box'
          input 'Send', type: 'submit'
