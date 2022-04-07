set ns [new Simulator]
set nf [open TwoNode.nam w]
$ns namtrace-all $nf
set n0 [$ns node]
set n1 [$ns node]
$ns duplex-link $n0 $n1 5mb 1ms DropTail
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set sink1 [new Agent/TCPSink]
$ns attach-agent  $n1 $sink1
$ns connect $tcp0 $sink1
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 4.0 "$ftp0 stop"

$ns at 5.0 "finish"
proc finish { } {
	global ns nf
	close $nf
	exec nam TwoNode.nam &
	exit 0 }
$ns run
