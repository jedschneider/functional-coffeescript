describe 'Funs', ->
  describe 'always', ->
    it 'defines always', ->
      expect(typeof Funs.always(true)).toEqual('function')

    it 'returns the closed over value', ->
      alwaysTrue = Funs.always('foo')
      expect(alwaysTrue()).toEqual 'foo'

  describe 'existy', ->
    beforeEach -> @existy = Funs.existy

    it 'is false for undefined/null things', ->
      expect(@existy(null)).toEqual(false)
      expect(@existy(undefined)).toEqual(false)
      expect(@existy((->)())).toEqual(false)
      expect(@existy({}.notHere)).toEqual(false)

    it 'is true for non-empty/existy things', ->
      expect(@existy(false)).toEqual(true)
      expect(@existy(0)).toEqual(true)

  describe 'truthy', ->
    beforeEach ->
      @truthy = Funs.truthy
    it 'is false for false like items', ->
      expect(@truthy(false)).toEqual(false)
      expect(@truthy(undefined)).toEqual(false)

    it 'is truthy for true like items', ->
      expect(@truthy(0)).toEqual(true)
      expect(@truthy('')).toEqual(true)


  describe 'doWhen', ->
    it 'is definded', ->
      expect(typeof Funs.doWhen).toEqual('function')

    it 'does the action when condition is true', ->
      spy = jasmine.createSpy()
      Funs.doWhen(true, spy)
      expect(spy).toHaveBeenCalled()

    it 'does the action when condition is true', ->
      spy = jasmine.createSpy()
      res = Funs.doWhen(false, spy)
      expect(spy).not.toHaveBeenCalled()
      expect(res).toEqual(undefined)

    it 'works in a concrete fashion', ->
      executeIfHasField = (target, name)->
        condition = Funs.existy(target[name])
        action    = -> _.result(target, name)
        Funs.doWhen(condition, action)

      expect(executeIfHasField([1,2,3], 'reverse')).toEqual([3,2,1])
