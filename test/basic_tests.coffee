#
# Mocha tests
# mocha -w --compilers coffee:coffee-script -R list --growl
#

assert = require 'assert'
Vector = (require '../vector').Vector

describe 'Simple operations', () ->
	
	vecA = new Vector(2,5)
	vecB = new Vector(-3,1)

	it 'clone', () ->
		vec = vecA.clone()
		assert.equal true, vecA.equal vec

	it 'set values', () ->
		vec = new Vector(null, null)
		vec.set 2, 3
		assert.deepEqual [2, 3], vec.get()

	it 'adding', () ->		
		vecC = vecA.add vecB
		assert.equal 2-3, vecC.x
		assert.equal 5+1, vecC.y

	it 'subtracting', () ->
		vecC = vecA.subtract vecB
		assert.deepEqual [2+3,5-1], vecC.get()

	it 'multiplying', () ->
		# Multiply by vector
		vec = vecA.multiply vecB
		assert.deepEqual [2*-3, 5*1], vec.get()
		# Multiply by scalar
		vec2 = vecA.multiply 2
		assert.deepEqual [2*2, 5*2], vec2.get()

	it 'divide', () ->
		# Divide by vector
		vec = vecA.divide vecB
		assert.deepEqual [2/-3, 5/1], vec.get()
		# Divide by scaler
		vec2 = vecA.divide 2
		assert.deepEqual [2/2, 5/2], vec2.get()

	it 'length', () ->
		assert.equal 3, (new Vector(3,0)).length()

	it 'normalize', () ->
		vec = new Vector(2,0)
		assert.deepEqual [1,0], vec.normalize().get()

	it 'dotproduct', () ->
		assert.equal 2*-3+5*1, vecA.dotproduct vecB

	it 'equals', () ->
		assert.equal false, vecA.equals vecB
		assert.equal true, vecA.equals vecA
		assert.equal true, vecA.equals (new Vector(2,5))

	it 'invert', () ->
		assert.deepEqual [3, -1], vecB.invert().get()
		assert.equal true, vecB.equals vecB.invert().invert()
