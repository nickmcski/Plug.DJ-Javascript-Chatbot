chatCommandDispatcher = (chat)->
    chatUniversals(chat)
    for cmd in cmds
    	c = new cmd(chat)
    	if c.evalMsg()
    		break
    	else
    	    API.sendChat("No permissions")