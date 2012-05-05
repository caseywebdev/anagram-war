@include = ->
  
  @view layout: ->
    doctype 5
    html ->
      head '#header', ->
        title "Anagram War | It's a war of the words."
        link rel: 'stylesheet', href: '/css/normalize.css'
        link rel: 'stylesheet', href: '/css/app.css'
        script src: '/socket.io/socket.io.js'
        script src: '/zappa/jquery.js'
        script src: '/js/underscore.js'
        script src: '/js/backbone.js'
        script src: '/js/extrascore.js'
        script src: '/zappa/zappa.js'
        script src: '/js/models/dictionary.js'
        script src: '/js/models/user.js'
        script src: '/js/models/tile.js'
        script src: '/js/models/rack.js'
        script src: '/js/models/battle.js'
        script src: '/js/views/lobby-view.js'
        script src: '/js/views/message-view.js'
        script src: '/js/views/user-view.js'
        script src: '/js/views/sign-in-view.js'
        script src: '/js/views/challenge-view.js'
        script src: '/js/views/battle-view.js'
        script src: '/js/app.js'
        script """
          Dictionary.words = _.reduce(#{JSON.stringify @words}, function(obj, word) {
            obj[word] = true;
            return obj;
          }, {});
        """
      body ->
        div '#sky', ->
          header '#header', ->
          div '#main', ->
        footer '#footer', ->
          p "It's a war of the words. Uses Node, Backbone, Underscore, jQuery, Express, Connect, Socket.io, Zappa, and anything else you can dream of."
          text "Copyright © 2012 <a href='http://caseywebdev.com/'>caseyWebDev</a>. All rights reserved. <a href='https://github.com/caseywebdev/anagram-war'>Source on GitHub</a>."
