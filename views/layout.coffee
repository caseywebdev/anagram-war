module.exports = ->
  @view layout: ->
    doctype 5
    html ->
      head ->
        title if @title then "#{@title} | Anagram War" else 'Anagram War'
        script src: '/underscore-min.js'
        script src: '/backbone-min.js'
        script src: '/socket.io/socket.io.js'
        script src: '/zappa/jquery.js'
        script src: '/zappa/zappa.js'
        script src: '/index.js'
        script src: '/user.js'
      body @body
