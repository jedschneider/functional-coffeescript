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

describe 'enumerable', ->
  it 'should be defined', ->
    expect(Enumerable).toBeDefined()

  describe 'nth', ->
    it 'works on arrays', ->
      expect(Enumerable.nth([1,2,3], 2)).toEqual(3)

    it 'works on strings', ->
      expect(Enumerable.nth("abc", 1)).toEqual("b")

    describe 'failing', ->
      beforeEach ->
        spyOn(window, 'fail')

      it 'on numbers', ->
        Enumerable.nth({}, 2)
        expect(window.fail).toHaveBeenCalledWith('Not supported on non-indexed types')

      it 'on index is non-number', ->
        Enumerable.nth("abc", "a")
        expect(window.fail).toHaveBeenCalledWith('Expected index to be a number')

      it 'if out of bounds', ->
        Enumerable.nth("abc", 5)
        expect(window.fail).toHaveBeenCalledWith('Out of bounds')

  describe 'comparator', ->
    beforeEach ->
      @pred = (x,y)-> x > y

    it 'returns a function', ->
      expect(typeof Enumerable.comparator(@pred)).toEqual('function')

    it 'returns -1 if last arg is less than first arg', ->
      res = Enumerable.comparator(@pred)(4,3)
      expect(res).toEqual(-1)

    it 'returns 1 if first arg is less than last arg', ->
      res = Enumerable.comparator(@pred)(3,4)
      expect(res).toEqual(1)

    it 'returns 0 if args are equal', ->
      res = Enumerable.comparator(@pred)(3,3)
      expect(res).toEqual(0)

    it 'works in a concrete context', ->
      lessOrEqual = (x,y)-> x <= y
      compare = Enumerable.comparator(lessOrEqual)
      res = [3, -1, 4, 15].sort(compare)
      expect(res).toEqual([-1, 3, 4, 15])

