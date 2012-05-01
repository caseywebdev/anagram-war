@include = ->
  @view layout: ->
    doctype 5
    html ->
      head ->
        title if @title then "#{@title} | Anagram War" else "Anagram War | It's a war of the words."
        link rel: 'stylesheet', href: '/stylesheets/normalize.css'
        link rel: 'stylesheet', href: '/stylesheets/application.css'
        script src: '/javascripts/underscore-min.js'
        script src: '/javascripts/backbone-min.js'
        script src: '/socket.io/socket.io.js'
        script src: '/zappa/jquery.js'
        script src: '/zappa/zappa.js'
        script src: '/javascripts/user.js'
        script src: '/javascripts/application.js'
      body @body
