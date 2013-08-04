class skipCommand extends Command
	init: ->
		@command='!skip'
		@parseType='exact'
		@rankPrivelege='mod'

	functionality: ->
        API.sendChat "Skipping"
        alert("Force skiping song")
        API.moderateForceSkip()
		
