-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2019 at 04:53 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `honeydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `eksekusi`
--

CREATE TABLE `eksekusi` (
  `id_eksekusi` int(11) NOT NULL,
  `input` varchar(255) DEFAULT NULL,
  `reaksioutput` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eksekusi`
--

INSERT INTO `eksekusi` (`id_eksekusi`, `input`, `reaksioutput`) VALUES
(1, 'whoami', 'root'),
(2, 'pwd', '/'),
(3, 'rm', ': There was some error in remove  the files..try again later'),
(4, 'uname', 'Linux server 4.11.0-32-generic #35~20.04.1-Ubuntu SMP Thu Jan 25 10:13:43 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux'),
(5, 'id', 'uid=0(root) gid=0(root) groups=0(root)'),
(6, 'chmod', ': There was some error in changing access the files..try again later'),
(7, 'chown', ': There was some error in changing owner the files..try again later'),
(8, 'mv', ': There was some error in moving the files..try again later'),
(9, 'cat /proc/cpuinfo', 'processor   : 0\r\nvendor_id   : GenuineIntel\r\ncpu family  : 6\r\nmodel       : 69\r\nmodel name  : Intel(R) Core(TM) i7-4500U CPU @ 1.80GHz\r\nstepping    : 1\r\nmicrocode   : 0x17\r\ncpu MHz     : 774.000\r\ncache size  : 4096 KB\r\nphysical id : 0\r\nsiblings    : 4\r\ncore id     : 0\r\ncpu cores   : 2\r\napicid      : 0\r\ninitial apicid  : 0\r\nfpu     : yes\r\nfpu_exception   : yes\r\ncpuid level : 13\r\nwp      : yes\r\nflags       : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid\r\nbogomips    : 3591.40\r\nclflush size    : 64\r\ncache_alignment : 64\r\naddress sizes   : 39 bits physical, 48 bits virtual\r\npower management:\r\n\r\nprocessor   : 1\r\nvendor_id   : GenuineIntel\r\ncpu family  : 6\r\nmodel       : 69\r\nmodel name  : Intel(R) Core(TM) i7-4500U CPU @ 1.80GHz\r\nstepping    : 1\r\nmicrocode   : 0x17\r\ncpu MHz     : 1600.000\r\ncache size  : 4096 KB\r\nphysical id : 0\r\nsiblings    : 4\r\ncore id     : 0\r\ncpu cores   : 2\r\napicid      : 1\r\ninitial apicid  : 1\r\nfpu     : yes\r\nfpu_exception   : yes\r\ncpuid level : 13\r\nwp      : yes\r\nflags       : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid\r\nbogomips    : 3591.40\r\nclflush size    : 64\r\ncache_alignment : 64\r\naddress sizes   : 39 bits physical, 48 bits virtual\r\npower management:\r\n\r\nprocessor   : 2\r\nvendor_id   : GenuineIntel\r\ncpu family  : 6\r\nmodel       : 69\r\nmodel name  : Intel(R) Core(TM) i7-4500U CPU @ 1.80GHz\r\nstepping    : 1\r\nmicrocode   : 0x17\r\ncpu MHz     : 800.000\r\ncache size  : 4096 KB\r\nphysical id : 0\r\nsiblings    : 4\r\ncore id     : 1\r\ncpu cores   : 2\r\napicid      : 2\r\ninitial apicid  : 2\r\nfpu     : yes\r\nfpu_exception   : yes\r\ncpuid level : 13\r\nwp      : yes\r\nflags       : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid\r\nbogomips    : 3591.40\r\nclflush size    : 64\r\ncache_alignment : 64\r\naddress sizes   : 39 bits physical, 48 bits virtual\r\npower management:\r\n\r\nprocessor   : 6\r\nvendor_id   : GenuineIntel\r\ncpu family  : 6\r\nmodel       : 69\r\nmodel name  : Intel(R) XEON(R) E-2186G @ 4.70GHz\r\nstepping    : 1\r\nmicrocode   : 0x17\r\ncpu MHz     : 4699.000\r\ncache size  : 12096 KB\r\nphysical id : 0\r\nsiblings    : 4\r\ncore id     : 1\r\ncpu cores   : 6\r\napicid      : 3\r\ninitial apicid  : 3\r\nfpu     : yes\r\nfpu_exception   : yes\r\ncpuid level : 13\r\nwp      : yes\r\nflags       : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid\r\nbogomips    : 3591.40\r\nclflush size    : 64\r\ncache_alignment : 64\r\naddress sizes   : 39 bits physical, 48 bits virtual\r\n'),
(10, 'cat /etc/passwd', 'root:x:0:0:root:/root:/bin/bash\r\ndaemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin\r\nbin:x:2:2:bin:/bin:/usr/sbin/nologin\r\nsys:x:3:3:sys:/dev:/usr/sbin/nologin\r\nsync:x:4:65534:sync:/bin:/bin/sync\r\ngames:x:5:60:games:/usr/games:/usr/sbin/nologin\r\nman:x:6:12:man:/var/cache/man:/usr/sbin/nologin\r\nlp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin\r\nmail:x:8:8:mail:/var/mail:/usr/sbin/nologin\r\nnews:x:9:9:news:/var/spool/news:/usr/sbin/nologin\r\nuucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin\r\nproxy:x:13:13:proxy:/bin:/usr/sbin/nologin\r\nwww-data:x:33:33:www-data:/var/www:/usr/sbin/nologin\r\nbackup:x:34:34:backup:/var/backups:/usr/sbin/nologin\r\nlist:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin\r\nirc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin\r\ngnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin\r\nnobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin\r\nsystemd-timesync:x:100:102:systemd Time Synchronization,,,:/run/systemd:/bin/false\r\nsystemd-network:x:101:103:systemd Network Management,,,:/run/systemd/netif:/bin/false\r\nsystemd-resolve:x:102:104:systemd Resolver,,,:/run/systemd/resolve:/bin/false\r\nsystemd-bus-proxy:x:103:105:systemd Bus Proxy,,,:/run/systemd:/bin/false\r\nsyslog:x:104:108::/home/syslog:/bin/false\r\n_apt:x:105:65534::/nonexistent:/bin/false\r\nmessagebus:x:106:110::/var/run/dbus:/bin/false\r\nuuidd:x:107:111::/run/uuidd:/bin/false\r\nlightdm:x:108:114:Light Display Manager:/var/lib/lightdm:/bin/false\r\nwhoopsie:x:109:116::/nonexistent:/bin/false\r\navahi:x:110:119:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/bin/false\r\ndnsmasq:x:111:65534:dnsmasq,,,:/var/lib/misc:/bin/false\r\ncolord:x:112:122:colord colour management daemon,,,:/var/lib/colord:/bin/false\r\nspeech-dispatcher:x:113:29:Speech Dispatcher,,,:/var/run/speech-dispatcher:/bin/false\r\nhplip:x:114:7:HPLIP system user,,,:/var/run/hplip:/bin/false\r\nkernoops:x:115:65534:Kernel Oops Tracking Daemon,,,:/:/bin/false\r\npulse:x:116:123:PulseAudio daemon,,,:/var/run/pulse:/bin/false\r\nnm-openvpn:x:117:125:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/bin/false\r\nrtkit:x:118:126:RealtimeKit,,,:/proc:/bin/false\r\nsaned:x:119:127::/var/lib/saned:/bin/false\r\nusbmux:x:120:46:usbmux daemon,,,:/var/lib/usbmux:/bin/false\r\nsys-admin:x:1000:1000:sys-admin,,,:/home/sys-admin:/bin/bash\r\nsshd:x:121:65534::/var/run/sshd:/usr/sbin/nologin'),
(11, 'cat /etc/shadow', 'root:$1$/avpfBJ1$x0z8w5UF9Iv./DR9E9Lid.:14747:0:99999:7:::\r\ndaemon:*:14684:0:99999:7:::\r\nbin:*:14684:0:99999:7:::\r\nsys:$1$fUX6BPOt$Miyc3UpOzQJqz4s5wFD9l0:14742:0:99999:7:::\r\nsync:*:14684:0:99999:7:::\r\ngames:*:14684:0:99999:7:::\r\nman:*:14684:0:99999:7:::\r\nlp:*:14684:0:99999:7:::\r\nmail:*:14684:0:99999:7:::\r\nnews:*:14684:0:99999:7:::\r\nuucp:*:14684:0:99999:7:::\r\nproxy:*:14684:0:99999:7:::\r\nwww-data:*:14684:0:99999:7:::\r\nbackup:*:14684:0:99999:7:::\r\nlist:*:14684:0:99999:7:::\r\nirc:*:14684:0:99999:7:::\r\ngnats:*:14684:0:99999:7:::\r\nnobody:*:14684:0:99999:7:::\r\nlibuuid:!:14684:0:99999:7:::\r\ndhcp:*:14684:0:99999:7:::\r\nsyslog:*:14684:0:99999:7:::\r\nklog:$1$f2ZVMS4K$R9XkI.CmLdHhdUE3X9jqP0:14742:0:99999:7:::\r\nsshd:*:14684:0:99999:7:::\r\nmsfadmin:$1$XN10Zj2c$Rt/zzCW3mLtUWA.ihZjA5/:14684:0:99999:7:::\r\nbind:*:14685:0:99999:7:::\r\npostfix:*:14685:0:99999:7:::\r\nftp:*:14685:0:99999:7:::\r\npostgres:$1$Rw35ik.x$MgQgZUuO5pAoUvfJhfcYe/:14685:0:99999:7:::\r\nmysql:!:14685:0:99999:7:::\r\ntomcat55:*:14691:0:99999:7:::\r\ndistccd:*:14698:0:99999:7:::\r\nuser:$1$HESu9xrH$k.o3G93DGoXIiQKkPmUgZ0:14699:0:99999:7:::\r\nservice:$1$kR3ue7JZ$7GxELDupr5Ohp6cjZ3Bu//:14715:0:99999:7:::\r\ntelnetd:*:14715:0:99999:7:::\r\nproftpd:!:14727:0:99999:7:::\r\nstatd:*:15474:0:99999:7:::'),
(12, 'cat /proc/mounts', 'rootfs / rootfs rw 0 0\r\ntmpfs /var tmpfs rw,nosuid,nodev,noexec,relatime,size=5120k 0 0\r\nsysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0\r\nproc /proc proc rw,nosuid,nodev,noexec,relatime 0 0\r\nudev /dev devtmpfs rw,relatime,size=289396k,nr_inodes=72349,mode=755 0 0'),
(13, 'cat /etc/hosts', '#Do not remove the following line, or various programs\r\n# that require network functionality will fail.\r\n127.0.0.1		localhost.localdomain localhost'),
(14, 'cat /etc/issue', 'Ubuntu 16.04\\n \\l'),
(15, 'cat /etc/resolv.conf', 'nameserver 208.67.222.222\r\nnameserver 208.67.220.220'),
(16, 'ls', 'drwxr-xr-x    2 root root   4096 bin/\r\ndrwxr-xr-x    3 root root   4096 boot/\r\ndrwxr-xr-x   10 root root  14320 dev/\r\ndrwxr-xr-x  100 root root   4096 etc/\r\ndrwxr-xr-x    7 root users  4096 home/\r\ndrwxr-xr-x   10 root root   8192 lib/\r\ndrwxr-xr-x    2 root root  49152 lost+found/\r\ndrwxr-xr-x    3 root root   4096 opt/\r\ndrwxr-xr-x    3 root root   4096 oracle/\r\ndrwxr-xr-x   10 root root      0 proc/\r\ndrwxr-xr-x    2 root root   4096 root/\r\ndrwxr-xr-x    2 root root   4096 sbin/\r\ndrwxr-xr-x    3 root root   4096 secure_firewall_ltd/\r\ndrwxr-xr-x    2 root root   4096 srv/\r\ndrwxr-xr-x   10 root root      0 sys/\r\ndrwxrwxrwt   11 root root   4096 tmp/\r\ndrwxr-xr-x   14 root root   4096 usr/\r\ndrwxr-xr-x   14 root root   4096 var/'),
(17, 'ifconfig', 'lo        Link encap:Local Loopback\r\n          inet addr:127.0.0.1  Mask:255.0.0.0\r\n          inet6 addr: ::1/128 Scope:Host\r\n          UP LOOPBACK RUNNING  MTU:65536  Metric:1\r\n          RX packets:2274 errors:0 dropped:0 overruns:0 frame:0\r\n          TX packets:2274 errors:0 dropped:0 overruns:0 carrier:0\r\n          collisions:0 txqueuelen:1\r\n          RX bytes:369050 (369.0 KB)  TX bytes:369050 (369.0 KB)\r\neth0  Link encap:Ethernet  HWaddr 0A:00:27:00:00:00\r\n          inet addr:10.10.0.25  Bcast:10.10.0.255  Mask:255.255.255.0\r\n          inet6 addr: fe80::800:27ff:fe00:0/64 Scope:Link\r\n          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1\r\n          RX packets:0 errors:0 dropped:0 overruns:0 frame:0\r\n          TX packets:215 errors:0 dropped:0 overruns:0 carrier:0\r\n          collisions:0 txqueuelen:1000\r\n          RX bytes:0 (0.0 b)  TX bytes:19754 (19.2 KiB)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eksekusi`
--
ALTER TABLE `eksekusi`
  ADD PRIMARY KEY (`id_eksekusi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
