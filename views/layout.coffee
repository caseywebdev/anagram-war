@include = ->
  @view layout: ->
    doctype 5
    html ->
      head ->
        title "Anagram War | It's a war of the words."
        link rel: 'stylesheet', href: '/css/normalize.css'
        link rel: 'stylesheet', href: '/css/app.css'
        script src: '/js/underscore-min.js'
        script src: '/js/backbone-min.js'
        script src: '/socket.io/socket.io.js'
        script src: '/zappa/jquery.js'
        script src: '/zappa/zappa.js'
        script src: '/js/models/user.js'
        script src: '/js/app.js'
      body ->
        div '.container', ->
          header()
          div id: 'main'
          footer()
