Anagram War
===========
It's a war of the words. Uses Node, Backbone, Underscore, jQuery, Express, Connect, Socket.io, Zappa, and anything else you can dream of.

How to Run
----------
You must have Node.js, NPM and CoffeeScript installed.

1. `cd /to/the/repo`
2. `npm install`
3. `coffee app`
4. go to http://localhost:3000 in your browser

How to Play
-----------
Anagram War is a multiplayer only game, so there must be at least one other person connected to the server to start a game. When you see someone else's name in the user list, you can click on their name to challenge them to a game. That user will then have the choice to accept or decline your challenge. If they accept, the game will start immediately. You will see 16 tiles on the screen that you will use to make as many words as possible. For example, if I see the letters A B C S T, I could write the words cat, cats, bat, bats, sat, stab, etc... The longer the word is, the more points it is worth. Words that are less than 3 letters are not worth any points. Each word may only be used by one player. If my opponent gets the word 'cat' before I do, I cannot get points for it. After 2 minutes the battle will end and you will return to the lobby where you can chat or start another battle.

Known Issues
------------
Anagram War is still just a youth.

- There are some connectivity issues that can occur when events are fire simultaneously. For example if one user is challenged by two users at the same time, one of the challengers will be stuck at the 'Waiting for user to accept or decline challenge.' screen.
- The countdown can be hard to see in the last 10 seconds.
- There is currently now way to cancel a challenge after it is sent unless the challengee declines.
