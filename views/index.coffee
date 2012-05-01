module.exports = ->
  @view index: ->
    div id: 'panel'
    form ->
      input id: 'box'
      input 'Send', type: 'submit'
