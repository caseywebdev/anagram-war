@include = ->
  @view layout: ->
    doctype 5
    html ->
      head '#header', ->
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
        div '#sky', ->
          header '#header', ->
          div '#main', ->
            div '#message-panel', ->
            form '#message-form', ->
              input '#message-box', ->
              input type: 'submit'
        footer '#footer', ->
          p "It's a war of the words. Uses Node, Backbone, Underscore, jQuery, Express, Connect, Socket.io, Zappa, and anything else you can dream of."
          text "Copyright © 2012 <a href='http://caseywebdev.com/'>caseyWebDev</a>. All rights reserved. <a href='https://github.com/caseywebdev/anagram-war'>Source on GitHub</a>."
