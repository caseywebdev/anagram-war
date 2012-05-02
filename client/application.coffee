@include = ->
  @client '/javascripts/application.js': ->
    
    @connect()
    
    Backbone.sync = ->
    
    users = new User.Collection
    user = new User
    
    @on disconnect: ->
      $('#panel').append "<p style='font-weight: bold; color: #d40'>You were disconnected.</p>"
      user = new User
    
    @on attr: ->
      user.set @data
    
    @on notice: ->
      $('#panel').append "<p style='font-weight: bold; color: #d40'>#{@data.text}</p>"
    
    @on say: ->
      $('#panel').append "<p>#{_.escape @data.name} said: #{_.escape @data.text}</p>"
    
    $ =>
      
      $('#box').focus()
      
      $('form').submit (e) =>
        if user.get 'name'
          @emit say: {text: $('#box').val()}
          
        else
          @emit attr:
            name: $('#box').val()
        $('#box').val('').focus()
        e.preventDefault()
