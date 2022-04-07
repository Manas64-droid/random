set ns [new Simulator]
$ns color 1 red
$ns color 2 green 
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set nf [open exp5tr.nam w]
$ns namtrace-all $nf
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n3 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail
$ns duplex-link $n2 $n4 1Mb 10ms DropTail
$ns duplex-link $n3 $n4 1Mb 10ms DropTail
$ns rtproto DV
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1
set null0 [new Agent/Null]
$ns attach-agent $n4 $null0
$udp0 set fid_ 1
$udp1 set fid_ 2
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.01
$cbr0 attach-agent $udp0
$ns connect $udp0 $null0
set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.01
$cbr1 attach-agent $udp1
$ns connect $udp1 $null0
$ns cost $n0 $n1 4
$ns cost $n0 $n2 2
$ns cost $n1 $n2 1
$ns cost $n1 $n3 3
$ns cost $n2 $n3 1
$ns cost $n2 $n4 2
$ns cost $n3 $n4 1
$ns at 0.5 "$cbr0 start"
$ns at 1.0 "$cbr1 start"
$ns at 4.5 "$cbr0 stop"
$ns at 4.5 "$cbr1 stop"
$ns rtmodel-at 1.5 down $n2 $n4
$ns rtmodel-at 2.0 down $n2 $n3
$ns rtmodel-at 3.0 up $n2 $n3
$ns rtmodel-at 3.5 down $n2 $n4
$ns at 5.0 "finish"
proc finish {} {
	global ns nf
	$ns flush-trace
	close $nf
	puts "running nam ..."
	exec nam exp5tr.nam &
	exit 0
}
$ns run
