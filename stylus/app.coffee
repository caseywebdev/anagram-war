@include = ->
  @stylus '/css/app.css': '''
    noise = url('/images/noise.png')
    container-width = 800px
    font-family = 'Helvetica Neue', Helvetica, Arial, sans-serif
    container(width = container-width)
      margin: 0 auto
      width: width
    
    body
      background: #630 noise
      font-family: font-family
      font-weight: 200
      font-size: 14px
      word-wrap: break-word
    
    a
      text-decoration: none
      cursor: pointer
    
    h1,
    h2,
    h3,
    h4,
    h5
      margin: 0
    
    p
      margin: 0 0 10px
    
    input
      outline: 0
      margin: 0
      border: 0
      padding: 0 3px
      height: 20px
      font-size: 14px
      font-family: font-family
      font-weight: 200
      border-radius: 3px
      box-shadow: 0 1px 3px rgba(0, 0, 0, .5)
    
    #sky
      min-width: container-width
      background: #ccf url('/images/sky.jpg') center bottom repeat-x
      box-shadow: 0 1px 50px #000
    
    #header
      container()
      height: 150px
      background: url('/images/header.png') no-repeat
    
    #main
      container()
      padding-bottom: 200px
      height: 410px;
      background: url('/images/footer.png') center bottom no-repeat
    
    #footer
      container(container-width - 100px)
      padding: 50px
      color: #eee
      text-align: center
      text-shadow: 0 1px 1px rgba(0, 0, 0, .75)
      font-size: 12px
      
      a
        color: #eee
        
        &:hover
          color: #fff
          text-decoration: underline
    
    #sign-in
      margin-top: 5px
    
    #users-container
      float: left
      width: 200px
      height: 410px
      overflow-y: auto
      
      h1
        font-size: 20px
        font-weight: 200
      
      .user
        display: block
        margin: 3px 0
        padding: 5px
        color: #fff
        background: #f96
        border-radius: 3px
        box-shadow: 0 1px 3px rgba(0, 0, 0, .5)
        
        &.in-battle
          background: #f66
      
    
    #chat-container
      float: right
      padding-left: 10px
      width: 590px
      color: #fff
      font-size: 16px
      text-shadow: 0 1px 1px rgba(0, 0, 0, .5)
      
      #chat-log
        margin-bottom: 10px
        height: 370px
        overflow-y: auto
      
      .notice
        color: #f66
      
      .name
        color: #f96
      
      .timestamp
        color: #9f9
      
      #say
        width: 584px
    
    #js-pop-up-container
      background: rgba(255, 255, 255, .75) noise
    
    #js-pop-up
      padding: 10px
      background: #fff noise
      box-shadow: 0 1px 3px rgba(0, 0, 0, .5)
      border-radius: 3px
      
      .error
        margin-bottom: 10px
        padding: 10px
        color: #fff
        background: #f66 noise
      
      input
        width: 200px
    
    #played-tiles
      margin-bottom: 10px
      min-height: 80px
      border-radius: 3px
      background: #fff noise
      box-shadow: 0 1px 3px rgba(0, 0, 0, .5)
      text-align: center
    
    #user1-container,
    #user2-container
      float: left
      width: 230px
      border-radius: 3px
      background: #fff noise
      box-shadow: 0 1px 3px rgba(0, 0, 0, .5)
      
      .name
        line-height: 40px
        color: #fff
        text-shadow: 0 1px 1px rgba(0, 0, 0, .5)
        background: #f96 noise
        text-align: center
        font-size: 20px
        border-top-left-radius: 3px
        border-top-right-radius: 3px
      
      .score
        line-height: 50px
        color: #fff
        text-shadow: 0 1px 1px rgba(0, 0, 0, .5)
        background: #f66 noise
        text-align: center
        font-size: 30px
      
      .words
        height: 210px
        overflow-y: auto
        padding: 10px
    
    #user2-container
      float: right
    
    #accept-challenge,
    #decline-challenge
      dislay: inline-block
      padding: 5px
      color: #fff
      text-shadow: 0 1px 1px rgba(0, 0, 0, .5)
      background: #9f9 noise
    
    #decline-challenge
      background-color: #f66
    
    #play-message
      position: absolute
      display: none
      width: 100%
      line-height: 80px
      font-size: 50px
      text-align: center
      text-shadow: 0 1px 1px rgba(0, 0, 0, .5)
      
      &.red
        color: #f66
        
      &.green
        color: #9f9
    
    #rack
      float: left
      padding: 0 10px
      width: 320px
      text-align: center
      
    .tile
      display: inline-block
      width: 80px
      padding-top: 20px
      height: 60px
      color: #fff
      text-shadow: 0 1px 1px rgba(0, 0, 0, .75)
      font-size: 30px
      text-align: center
      background: url('/images/tile.png') center no-repeat
  '''