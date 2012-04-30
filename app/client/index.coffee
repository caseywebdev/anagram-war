module.exports = ->
  @client '/index.js': ->
    @connect()
    
    @on said: ->
      $('#panel').append "<p>#{@data.nickname} said: #{@data.text}</p>"
    
    $ =>
      @emit 'set nickname': {nickname: prompt 'Pick a nickname!'}
      
      $('#box').focus()
      
      $('form').submit (e) =>
        @emit said: {text: $('#box').val()}
        $('#box').val('').focus()
        e.preventDefault()
