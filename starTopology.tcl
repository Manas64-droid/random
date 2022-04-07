set ns [new Simulator]
set nf [open exp3.nam w]
$ns namtrace-all $nf
$ns color 1 Blue
$ns color 2 Red
proc finish {} {
	global ns nf
	$ns flush-trace
	close $nf
	exec nam exp3.nam & 
	exit 0
}
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
$n2 shape square
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n3 $n2 1Mb 10ms DropTail
set udp0 [new Agent/UDP]
$udp0 set class_ 1
$ns attach-agent $n0 $udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packerSize_ 500
$cbr0 set interval_ 0.01
$cbr0 attach-agent $udp0
set cbr1 [new Application/Traffic/CBR]
set udp1 [new Agent/UDP]
$udp1 set class_ 2
$ns attach-agent $n1 $udp1
$cbr1 set packerSize_ 500
$cbr1 set interval_ 0.01
$cbr1 attach-agent $udp1
set null0 [new Agent/Null]
$ns attach-agent $n3 $null0
$ns connect $udp0 $null0
$ns connect $udp1 $null0
$ns at 0.5 "$cbr0 start"
$ns at 1.0 "$cbr1 start"
$ns at 4.0 "$cbr1 stop"
$ns at 4.5 "$cbr0 stop"
$ns at 5.0 "finish"
$ns run
