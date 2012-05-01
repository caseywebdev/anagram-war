@include = ->
  @client '/javascripts/application.js': ->
    @connect()
    
    @on said: ->
      $('#panel').append "<p>#{@data.nickname} said: #{@data.text}</p>"
    
    $ =>
      @emit 'set nickname': {nickname: 'Billy'}
      
      $('#box').focus()
      
      $('form').submit (e) =>
        @emit said: {text: $('#box').val()}
        $('#box').val('').focus()
        e.preventDefault()
