@include = ->
  @client '/js/app.js': ->
    
    @connect()
    
    Backbone.sync = ->
    
    users = new User.Collection
    user = new User
    
    @on connection: ->
      $('#message-panel').append "<p style='font-weight: bold; color: #d40'>You were disconnected.</p>"
    
    @on disconnect: ->
      if user.get 'name'
        $('#message-panel').append "<p style='font-weight: bold; color: #d40'>You were disconnected.</p>"
      user = new User
    
    @on attr: ->
      user.set @data
    
    @on notice: ->
      $('#message-panel').append "<p style='font-weight: bold; color: #d40'>#{@data.text}</p>"
    
    @on say: ->
      $('#message-panel').append "<p>#{_.escape @data.name} said: #{_.escape @data.text}</p>"
    
    $ =>
      
      $('#message-box').focus()
      
      $('#message-form').submit (e) =>
        if user.get 'name'
          @emit say: {text: $('#message-box').val()}
          
        else
          @emit attr:
            name: $('#message-box').val()
        $('#message-box').val('').focus()
        e.preventDefault()
