class window.Funs
  @always: (value)->
    -> value

  # maybe this doesn't need its own function in coffeescript?
  @existy: (x)->
    x?

  @truthy: (x)->
    x != false and x?

  @doWhen: (cond, action)->
    if @truthy(cond) then action()

