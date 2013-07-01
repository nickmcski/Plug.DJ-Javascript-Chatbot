class lockCommand extends Command
	init: ->
		@command='/lock'
		@parseType='exact'
		@rankPrivelege='mod'

	functionality: ->
		API.sendChat 'Pop and lock dat'
		data.lockBooth()
