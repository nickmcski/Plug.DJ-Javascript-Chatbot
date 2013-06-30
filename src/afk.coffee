afkCheck = ->
  for id,user of data.users
    now = new Date()
    lastActivity = user.getLastActivity()
    timeSinceLastActivity = now.getTime() - lastActivity.getTime()
    if timeSinceLastActivity > data.afkTime #has been inactive longer than afk time limit
      if user.getIsDj()#if on stage
        secsLastActive = timeSinceLastActivity / 1000
        if user.getWarningCount() == 0
          user.warn()
          API.sendChat "@"+user.getUser().username+", I haven't seen you chat or vote in at least 2 hours. Are you AFK?  If you don't show activity in 5 minutes I will remove you."
        else if user.getWarningCount() == 1
          lastWarned = user.getLastWarning()#last time user was warned
          timeSinceLastWarning = now.getTime() - lastWarned.getTime()
          twoMinutes = 5*60*1000
          if timeSinceLastWarning > twoMinutes
            user.warn()
            warnMsg = "@"+user.getUser().username
            warnMsg += ", I haven't seen you chat or vote in at least 2 hours now.  This is your second and FINAL warning.  If you do not chat or vote in the next minute I will remove you."
            API.sendChat warnMsg
        else if user.getWarningCount() == 2#Time to remove
          lastWarned = user.getLastWarning()#last time user was warned
          timeSinceLastWarning = now.getTime() - lastWarned.getTime()
          oneMinute = 1*60*1000
          if timeSinceLastWarning > oneMinute
            DJs = API.getDJs()
            if DJs.length > 0 and DJs[0].id != user.getUser().id
              API.sendChat "@"+user.getUser().username+", you had 2 warnings. Please stay active by chatting or voting."
              API.moderateRemoveDJ id
      else
        user.notDj()

msToStr = (msTime) ->
  msg = ''
  timeAway = {'days':0,'hours':0,'minutes':0,'seconds':0}
  ms = {'day':24*60*60*1000,'hour':60*60*1000,'minute':60*1000,'second':1000}

  #split into days hours minutes and seconds
  if msTime > ms['day']
    timeAway['days'] = Math.floor msTime / ms['day']
    msTime = msTime % ms['day']
  if msTime > ms['hour']
    timeAway['hours'] = Math.floor msTime / ms['hour']
    msTime = msTime % ms['hour']
  if msTime > ms['minute']
    timeAway['minutes'] = Math.floor msTime / ms['minute']
    msTime = msTime % ms['minute']
  if msTime > ms['second']
    timeAway['seconds'] = Math.floor msTime / ms['second']

  #add non zero times
  if timeAway['days'] != 0
    msg += timeAway['days'].toString() + 'd'
  if timeAway['hours'] != 0
    msg += timeAway['hours'].toString() + 'h'
  if timeAway['minutes'] != 0
    msg += timeAway['minutes'].toString() + 'm'
  if timeAway['seconds'] != 0
    msg += timeAway['seconds'].toString() + 's'

  if msg != ''
    return msg
  else
    return false
