Backbone = require 'backbone'

@include = ->
  @shared '/javascripts/user.js': ->
    
    root = window ? global
    
    class root.User extends Backbone.Model
      
      connect: ->
        z.client.connect()
      
    class root.User.Collection extends Backbone.Collection
      
      model: User
