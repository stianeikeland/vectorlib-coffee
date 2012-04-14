# Simple 2D vector lib

class Vector

	constructor: (@x, @y) ->
	
	clone: () ->
		new Vector(@x, @y)

	set: (@x, @y) ->

	get: () ->
		[@x, @y]

	add: (other) ->
		new Vector(@x + other.x, @y + other.y)

	subtract: (other) ->
		new Vector(@x - other.x, @y - other.y)

	multiply: (other) ->
		if other instanceof Vector
			new Vector(@x * other.x, @y * other.y)
		else
			new Vector(@x * other, @y * other)

	divide: (other) ->
		if other instanceof Vector
			new Vector(@x / other.x, @y / other.y)
		else
			new Vector(@x / other, @y / other)

	normalize: () ->
		len = @length()
		new Vector(@x / len, @y / len)

	length: () ->
		Math.sqrt(@x * @x + @y + @y)

	dotproduct: (other) ->
		@x * other.x + @y * other.y

	toString: () ->
		"[#{@x},#{@y}]"

	invert: () ->
		@multiply -1

	equals: (other) ->
		@x is other.x and @y is other.y

	equal: (other) ->
		@equals other

# Export
(exports ? this).Vector = Vector
