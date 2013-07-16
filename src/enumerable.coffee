class window.Enumerable
  @isIndexed: (data)->
    _.isArray(data) or _.isString(data)

  @nth: (list, index)->
    fail('Expected index to be a number') if not _.isNumber(index)
    fail('Not supported on non-indexed types') if not @isIndexed(list)
    if index < 0 or index > list.length - 1
      fail("Out of bounds")
    list[index]

  # a coffeescript variant on what Fogus creates using built in truthiness
  # could I be missing an edge case?
  @comparator: (pred)->
    (x,y)->
      if pred(x,y) then -1
      else
        if pred(y,x) then 1 else 0


