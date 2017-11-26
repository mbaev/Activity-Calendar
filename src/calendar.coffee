class Calendar extends Element
  constructor: ({container, color, data, intervals, day_size, num_weeks}) ->
    super 'div', 'Calendar'
    document.getElementById(container).appendChild @_ if container
    intervals = intervals || [4, 10, 15, 20]
    maxInterval = intervals[intervals.length - 1]

    dayHolder = @makeHolder data, day_size, num_weeks
    datestr_coord_map = {}
    MS_IN_DAY = 1000 * 60 * 60 * 24
    t = new Date()
    day = t.getDay() #  [Sun..Sat] <-> [0..6]
    day = (7 + day - 1) % 7 #  [Mon..Sun] <-> [0..6]
    days_until_next_sunday = 6 - day
    t = new Date(t.getTime() + (MS_IN_DAY * days_until_next_sunday))
    for x in [(num_weeks - 1)..0]
      for y in [(7 - 1)..0]
        datestr_coord_map[strftime_Ymd(t)] = "#{x}:#{y}"
        t = new Date(t.getTime() - MS_IN_DAY)

    days = {}
    for x in [0...num_weeks]
      for y in [0...7]
        day = D()
        day.setStyles {
          width: day_size + 'px'
          height: day_size + 'px'
          background: '#ebedf0'
          position: 'absolute'
          left: (1 + (day_size + 2) * x) + 'px'
          top: (1 + (day_size + 2) * y) + 'px'
          zIndex: 2
        }
        days["#{x}:#{y}"] = day
        dayHolder.appendChild day

    for [date, points] in data
      coord = datestr_coord_map[date]
      interval = intervals[key+1] for i, key in intervals when i < points
      days[coord].setStyles(background: color, opacity: 1 / maxInterval * interval) if coord
      days[coord]._.setAttribute 'title', date

  getColor: (points) ->


  makeHolder: (data, day_size, num_weeks) ->
    w = (day_size * num_weeks) + (1 * (num_weeks + 1))
    h = (day_size * 7) + (1 * (7 + 1))
    daysHolder = D()
    daysHolder.setStyles {
      width: w + 'px'
      height: h + 'px'
      position: 'relative'
      background: '#FFFFFF'
    }
    @appendChild daysHolder
    daysHolder

  rjust_2_0 = (s) ->
    if s.length == 1 then "0#{s}" else s

  strftime_Ymd = (date) ->
    Y = 1900 + date.getYear()
    m = rjust_2_0("" + (date.getMonth() + 1))
    d = rjust_2_0("" + date.getDate())
    "#{Y}-#{m}-#{d}"