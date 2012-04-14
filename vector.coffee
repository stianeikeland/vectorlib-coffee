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
		new Vector(@x * other.x, @y * other.y)
		
	divide: (other) ->
		new Vector(@x / other.x, @y / other.y)
	
	normalize: () ->
		len = @length()
		new Vector(@x / len, @y / len)
		
	length: () ->
		Math.sqrt(@x * @x + @y + @y)
		
	dotproduct: (other) ->
		@x * other.x + @y * other.y
		
	toString: () ->
		return "[#{@x},#{@y}]"
		
	equals: (other) ->
		@x == other.x and @y == other.y
	
	equal: (other) ->
		@equals other
	
	

# Export
(exports ? this).Vector = Vector