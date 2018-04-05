#!/bin/bash
#
# demonstrate the effect of "process niceness"
#
{ time tar -cJf /tmp/tar-p19.tar.xz /home/. 2>/dev/null ; } 2> time-tar-1.log &
{ time tar -cJf /tmp/tar-m10.tar.xz /home/. 2>/dev/null ; } 2> time-tar-2.log &
#
echo "Two tar processes have been started in the background."
echo "Now, please go to a different terminal and give the *xz* processes"
echo "different \"niceness:\""
echo ""
echo "Find the PIDs:"
echo "	ps aux | grep xz"
echo "Set different niceness:"
echo " 	sudo renice -10 -p <PID of one xz process>"
echo " 	sudo renice 19 -p <PID of the other xz process>"
echo ""
echo ""
echo "This command causes a permanent high CPU load in a third process:"
echo "	dd if=/dev/urandom of=/dev/zero"
echo ""
echo "You will have to terminate this script manually (using Ctrl+C),"
echo "but normally you should wait until the tar processes have finished."
echo ""
echo "What are your results (in time-tar-[1|2].log)?"
echo ""
dd if=/dev/urandom of=/dev/zero
