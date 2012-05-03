Backbone = require 'backbone'

@include = ->
  @shared '/js/models/user.js': ->
    
    root = window ? global
    z = @
    
    class root.User extends Backbone.Model
      
      connect: ->
        z.client.connect()
      
    class root.User.Collection extends Backbone.Collection
      
      model: User
