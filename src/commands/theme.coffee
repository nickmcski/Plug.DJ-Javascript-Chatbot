class themeCommand extends Command
	init: ->
		@command='!theme'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg = "Almost any music is allowed here"
		API.sendChat(msg)
