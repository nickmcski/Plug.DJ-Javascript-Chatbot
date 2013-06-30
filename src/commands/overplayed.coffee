class overplayedCommand extends Command
	init: ->
		@command='/overplayed'
		@parseType='exact'
		@rankPrivelege='user'

	functionality: ->
		API.sendChat "Please dont overplay songs"
		
