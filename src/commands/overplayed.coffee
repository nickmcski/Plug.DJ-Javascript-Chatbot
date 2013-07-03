class overplayedCommand extends Command
	init: ->
		@command='/overplayed'
		@parseType='exact'
		@rankPrivelege='mod'

	functionality: ->
		API.sendChat "Please dont overplay songs"
		API.getDJs().slice(1)
