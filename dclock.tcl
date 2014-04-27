

#---------------------------#
#                           #
#       ponto's clock       #
#                           #
#---------------------------#


set back_col white
set forw_col black

set hour ""
set minute ""

set flag 1

## widgets
menu .m1
menu .m1.options -tearoff false;
.m1 add cascade -label Option -menu .m1.options -underline 6
.m1.options add command -label "Back color"  -command {
    set before_back_col $back_col
    set back_col [tk_chooseColor -initialcolor $back_col]
    if {[string equal "" $back_col]} {
	set back_col $before_back_col
    }
}
.m1.options add command -label "Forward color"  -command {
    set before_forw_col $forw_col
    set forw_col [tk_chooseColor -initialcolor $forw_col]
    if {[string equal "" $forw_col]} {
	set forw_col $before_forw_col
    }
}
menu .m1.alarm -tearoff false;
.m1 add cascade -label Alarm -menu .m1.alarm -underline 6
.m1.alarm add command -label "Set Alarm"  -command {
    if { [winfo exists .alarm] == 1} {
	raise .alarm
    } else {
	toplevel .alarm
	label .alarm.l1 -text "Input the time you want to alarm \n hour & minute "
	entry .alarm.hour -width 5 -textvariable hour
	entry .alarm.minute -width 5 -textvariable minute
	button .alarm.ok -text "OK" -command { destroy .alarm }
	grid .alarm.l1 -  -sticky ew
	grid .alarm.hour .alarm.minute  -sticky ew
	grid .alarm.ok  -  -sticky ew
    }
}

. configure -menu .m1

frame .f0
frame .f1
frame .f2
frame .f3
frame .f4
frame .f5
frame .g0
frame .g1

for {set h 0} {$h < 6 } {incr h} {
    for {set i 0} {$i < 9} {incr i} {
	for {set j 0} {$j < 6} {incr j} {
	    button .f$h.b$i$j -bg $back_col
	    grid .f$h.b$i$j -row $i -column $j -sticky news
	}
    }
}

for {set i 0} {$i < 2} {incr i} {
    for {set j 0} {$j < 9} {incr j} {
	button .g$i.c$j -bg $back_col
	grid .g$i.c$j -sticky news

	if { $j == 2 || $j == 6 } {
	    .g$i.c$j configure -bg $forw_col
	}
    }
}

grid .f0 .f1 .g0 .f2 .f3 .g1 .f4 .f5


## arrays

set zero(0) {0 0 0 0 0 0}
set zero(1) {0 1 1 1 1 0}
set zero(2) {0 1 0 0 1 0}
set zero(3) {0 1 0 0 1 0}
set zero(4) {0 1 0 0 1 0}
set zero(5) {0 1 0 0 1 0}
set zero(6) {0 1 0 0 1 0}
set zero(7) {0 1 1 1 1 0}
set zero(8) {0 0 0 0 0 0}

set one(0) {0 0 0 0 0 0}
set one(1) {0 0 0 1 0 0}
set one(2) {0 0 0 1 0 0}
set one(3) {0 0 0 1 0 0}
set one(4) {0 0 0 1 0 0}
set one(5) {0 0 0 1 0 0}
set one(6) {0 0 0 1 0 0}
set one(7) {0 0 0 1 0 0}
set one(8) {0 0 0 0 0 0}

set two(0) {0 0 0 0 0 0}
set two(1) {0 1 1 1 1 0}
set two(2) {0 0 0 0 1 0}
set two(3) {0 0 0 0 1 0}
set two(4) {0 1 1 1 1 0}
set two(5) {0 1 0 0 0 0}
set two(6) {0 1 0 0 0 0}
set two(7) {0 1 1 1 1 0}
set two(8) {0 0 0 0 0 0}

set three(0) {0 0 0 0 0 0}
set three(1) {0 1 1 1 1 0}
set three(2) {0 0 0 0 1 0}
set three(3) {0 0 0 0 1 0}
set three(4) {0 1 1 1 1 0}
set three(5) {0 0 0 0 1 0}
set three(6) {0 0 0 0 1 0}
set three(7) {0 1 1 1 1 0}
set three(8) {0 0 0 0 0 0}

set fore(0) {0 0 0 0 0 0}
set fore(1) {0 1 0 0 1 0}
set fore(2) {0 1 0 0 1 0}
set fore(3) {0 1 0 0 1 0}
set fore(4) {0 1 1 1 1 0}
set fore(5) {0 0 0 0 1 0}
set fore(6) {0 0 0 0 1 0}
set fore(7) {0 0 0 0 1 0}
set fore(8) {0 0 0 0 0 0}

set five(0) {0 0 0 0 0 0}
set five(1) {0 1 1 1 1 0}
set five(2) {0 1 0 0 0 0}
set five(3) {0 1 0 0 0 0}
set five(4) {0 1 1 1 1 0}
set five(5) {0 0 0 0 1 0}
set five(6) {0 0 0 0 1 0}
set five(7) {0 1 1 1 1 0}
set five(8) {0 0 0 0 0 0}

set six(0) {0 0 0 0 0 0}
set six(1) {0 1 1 1 1 0}
set six(2) {0 1 0 0 0 0}
set six(3) {0 1 0 0 0 0}
set six(4) {0 1 1 1 1 0}
set six(5) {0 1 0 0 1 0}
set six(6) {0 1 0 0 1 0}
set six(7) {0 1 1 1 1 0}
set six(8) {0 0 0 0 0 0}

set seven(0) {0 0 0 0 0 0}
set seven(1) {0 1 1 1 1 0}
set seven(2) {0 1 0 0 1 0}
set seven(3) {0 0 0 0 1 0}
set seven(4) {0 0 0 0 1 0}
set seven(5) {0 0 0 0 1 0}
set seven(6) {0 0 0 0 1 0}
set seven(7) {0 0 0 0 1 0}
set seven(8) {0 0 0 0 0 0}

set eight(0) {0 0 0 0 0 0}
set eight(1) {0 1 1 1 1 0}
set eight(2) {0 1 0 0 1 0}
set eight(3) {0 1 0 0 1 0}
set eight(4) {0 1 1 1 1 0}
set eight(5) {0 1 0 0 1 0}
set eight(6) {0 1 0 0 1 0}
set eight(7) {0 1 1 1 1 0}
set eight(8) {0 0 0 0 0 0}

set nine(0) {0 0 0 0 0 0}
set nine(1) {0 1 1 1 1 0}
set nine(2) {0 1 0 0 1 0}
set nine(3) {0 1 0 0 1 0}
set nine(4) {0 1 1 1 1 0}
set nine(5) {0 0 0 0 1 0}
set nine(6) {0 0 0 0 1 0}
set nine(7) {0 1 1 1 1 0}
set nine(8) {0 0 0 0 0 0}


# arrays for d=(^o^)=b
set d(0) {0 0 0 0 0 0}
set d(1) {0 0 0 0 1 0}
set d(2) {0 0 0 0 1 0}
set d(3) {0 0 0 0 1 0}
set d(4) {0 1 1 1 1 0}
set d(5) {0 1 0 0 1 0}
set d(6) {0 1 0 0 1 0}
set d(7) {0 1 1 1 1 0}
set d(8) {0 0 0 0 0 0}

set left(0) {0 0 0 0 0 0}
set left(1) {0 0 0 0 1 1}
set left(2) {0 0 0 1 0 0}
set left(3) {1 1 0 1 0 0}
set left(4) {0 0 0 1 0 0}
set left(5) {1 1 0 1 0 0}
set left(6) {0 0 0 1 0 0}
set left(7) {0 0 0 0 1 1}
set left(8) {0 0 0 0 0 0}

set face1(0) {0 0 0 0 0 0}
set face1(1) {0 0 1 0 0 0}
set face1(2) {0 1 0 1 0 0}
set face1(3) {0 0 0 0 0 0}
set face1(4) {0 0 0 0 0 1}
set face1(5) {0 0 0 0 1 0}
set face1(6) {0 0 0 1 0 0}
set face1(7) {0 0 0 0 1 0}
set face1(8) {0 0 0 0 0 1}

set face2(0) {0 0 0 0 0 0}
set face2(1) {0 0 0 1 0 0}
set face2(2) {0 0 1 0 1 0}
set face2(3) {0 0 0 0 0 0}
set face2(4) {1 0 0 0 0 0}
set face2(5) {0 1 0 0 0 0}
set face2(6) {0 0 1 0 0 0}
set face2(7) {0 1 0 0 0 0}
set face2(8) {1 0 0 0 0 0}

set right(0) {0 0 0 0 0 0}
set right(1) {1 1 0 0 0 0}
set right(2) {0 0 1 0 0 0}
set right(3) {0 0 1 0 1 1}
set right(4) {0 0 1 0 0 0}
set right(5) {0 0 1 0 1 1}
set right(6) {0 0 1 0 0 0}
set right(7) {1 1 0 0 0 0}
set right(8) {0 0 0 0 0 0}

set b(0) {0 0 0 0 0 0}
set b(1) {0 1 0 0 0 0}
set b(2) {0 1 0 0 0 0}
set b(3) {0 1 0 0 0 0}
set b(4) {0 1 1 1 1 0}
set b(5) {0 1 0 0 1 0}
set b(6) {0 1 0 0 1 0}
set b(7) {0 1 1 1 1 0}
set b(8) {0 0 0 0 0 0}


# procs

proc timer {} {
    global flag
    global nowsecond
    if { $flag == 1 } {
    set nowsecond [clock format [clock seconds] -format "%S"]
    set nowminute [clock format [clock seconds] -format "%M"]
    set nowhour [clock format [clock seconds] -format "%H"]
    input_arrays $nowsecond 4
    input_arrays $nowminute 2
    input_arrays $nowhour 0
    alarm $nowhour $nowminute $nowsecond
    }
    after 100 timer
}

proc input_arrays { times dock } {

    global zero one two three fore five six seven eight nine

    # 時間の１の位の場所
    set dock_next [ expr $dock + 1 ]

    # 渡された時間の1の位の数字によって使う arrays を選択。
    if { [string match "?0" $times] } {
	show zero $dock_next
    } elseif { [string match "?1" $times] } {
	show one $dock_next
    } elseif { [string match "?2" $times] } {
	show two $dock_next
    } elseif { [string match "?3" $times] } {
	show three $dock_next
    } elseif { [string match "?4" $times] } {
	show fore $dock_next
    } elseif { [string match "?5" $times] } {
	show five $dock_next
    } elseif { [string match "?6" $times] } {
	show six $dock_next
    } elseif { [string match "?7" $times] } {
	show seven $dock_next
    } elseif { [string match "?8" $times] } {
	show eight $dock_next
    } else {
	show nine $dock_next
    }

    if { [string match "0?" $times] } {
	show zero $dock
    } elseif { [string match "1?" $times] } {
	show one $dock
    } elseif { [string match "2?" $times] } {
	show two $dock
    } elseif { [string match "3?" $times] } {
	show three $dock
    } elseif { [string match "4?" $times] } {
	show fore $dock
    } else {
	show five $dock
    }
}

proc show {num dock} {
    upvar $num number
    global back_col forw_col

    for {set i 0} {$i < 9} {incr i} {
	for {set j 0} {$j < 6 } {incr j} {

	    if { [lindex $number($i) $j] == 1 } {
		.f$dock.b$i$j configure -bg $forw_col ;update
	    } else {
		.f$dock.b$i$j configure -bg $back_col ;update
	    }
	}
    }

    for {set i 0} {$i < 2} {incr i} {
	for {set j 0} {$j < 9} {incr j} {
	    if { $j == 2 || $j == 6 } {
		.g$i.c$j configure -bg $forw_col
	    } else {
		.g$i.c$j configure -bg $back_col
	    }
	}
    }
}

proc alarm {nowhour nowminute nowsecond} {
    global minute hour
    if { $nowminute == $minute && $nowhour == $hour && $nowsecond == "00"} {
	if { [winfo exists .message] == 1} {
	    raise .message
	} else {
	    toplevel .message
	    wm resizable .message 0 0
	    label .message.com -text "It's time !!!! \n $nowhour:$minute "
	    button .message.ok -text "OK" -command { destroy .message }
	    grid .message.com -sticky ew
	    grid .message.ok -sticky ew
	}
    }
}


# d=(^o^)=b
proc secret { } {

    global d left face1 face2 right b back_col forw_col

  show d 0
  show left 1
  show face1 2
  show face2 3
  show right 4
  show b 5

    for {set i 0} {$i < 2} {incr i} {
	for {set j 0} {$j < 9} {incr j} {
	    .g$i.c$j configure  -bg $back_col
	}
    }

}

# main

wm resizable . 0 0

timer

# d=(^o^)=b
.f5.b85 configure -command {
    set flag [expr $flag * -1]
    if { $flag == -1 } {
	secret
    }
}
