@include = ->
  @view layout: ->
    doctype 5
    html ->
      head ->
        title if @title then "#{@title} | Anagram War" else "Anagram War | It's a war of the words."
        link rel: 'stylesheet', href: '/normalize.css'
        link rel: 'stylesheet', href: '/application.css'
        script src: '/underscore-min.js'
        script src: '/backbone-min.js'
        script src: '/socket.io/socket.io.js'
        script src: '/zappa/jquery.js'
        script src: '/zappa/zappa.js'
        script src: '/user.js'
        script src: '/application.js'
      body @body
