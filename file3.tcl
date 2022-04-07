set x 10
proc fun {a b} {
	global x
	set x 12
}
puts $x
fun 2 4
puts $x
