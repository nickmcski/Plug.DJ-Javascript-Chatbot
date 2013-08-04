class whyWootCommand extends Command
	init: ->
		@command='!whywoot'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg = "Wooting is a good way to show suppot the current DJ"

		if((nameIndex = @msgData.message.indexOf('@')) != -1)
			API.sendChat @msgData.message.substr(nameIndex) + ', ' + msg
		else
			API.sendChat msg