_ = require 'underscore'

@include = ->
  
  users = new User.Collection
  
  @on connection: ->
    @client.user = new User
  
  @on disconnect: ->
    if name = @client.user.get 'name'
      @broadcast notice:
        room: @client.user.get 'room'
        text: "#{name} has disconnected."
      @client.user.destroy()
  
  @on attr: ->
    if @client.user.get 'name'
      @client.user.set @data
      @emit attr: @client.user.attributes
    else
      room = 'lobby'
      name = (@data.name or '').replace(/\s+/, ' ').replace /^ | $/, ''
      matches = users.filter (u) ->
        u.get('name').toLowerCase() is name.toLowerCase()
      if name and not matches.length
        @client.user.set
          room: room
          name: name
        users.add @client.user
        @emit attr: @client.user.attributes
        @emit notice:
          room: room
          text: "Welcome to Anagram War, #{_.escape name}!"
        @broadcast notice:
          room: room
          text: "#{name} has connected."
      else
        @emit error:
          text: 'That name is unavailable, please choose another.'
    
  
  @on say: ->
    text = @data.text.replace(/\s+/, ' ').replace /^ | $/, ''
    if text
      data =
        room: @client.user.get 'room'
        name: @client.user.get 'name'
        text: text
      @broadcast say: data
      @emit say: data
