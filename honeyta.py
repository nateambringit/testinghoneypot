import  threading
import socket
import sys
import time
import traceback
import  paramiko


FILELOG = open("log/honeyta.log","a")
LOGINLOG = open("login.log","a")
SSH_KEY = paramiko.RSAKey(filename='sshkey/honeyta.key')
PORT = 22


def server_command_handle(server_command, ssh_channel):
    respon = ""
    if server_command.startswith("whoami"):
        respon = "root"
    elif server_command.startswith("pwd"):
        respon = "/"
    elif server_command.startswith("ls"):
        respon = "Home Document Pictures Videos Downloads"
    elif server_command.startswith("rm"):
        respon = "you need permission for this action."
    elif server_command.startswith("uname"):
        respon = "Linux server 4.13.0-32-generic #35~16.04.1-Ubuntu SMP Thu Jan 25 10:13:43 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux"
    elif server_command.startswith("id"):
        respon = "uid=0(root) gid=0(root) groups=0(root)"

    elif server_command.startswith("chmod"):
        respon = "There was some error in changing access the files..try again later"

    elif server_command.startswith("chown"):
        respon = "There was some error in changing owner the files..try again later"

    elif server_command.startswith("mv"):
        respon = "There was some error in moving the files..try again later"

    elif server_command.startswith("cat /proc/cpuinfo"):
        isi("cpuinfo",ssh_channel)
        return
    elif server_command.startswith("cat /etc/passwd"):
        isi("passwd",ssh_channel)
        return

    FILELOG.write(respon + "\n")
    FILELOG.flush()
    ssh_channel.send(respon + "\r\n")

def isi(nama_file, ssh_channel):
    with open('fakefiles/{}'.format(nama_file)) as text:
        ssh_channel.send("\r")
        for line in enumerate(text):
            FILELOG.write(line[1])
            ssh_channel.send(line[1]+ "\r")
    FILELOG.flush()



class Honeyta(paramiko.ServerInterface):
    def __init__(self):
        self.te = threading.Event()

    def check_channel_request(self, kind, chanid):
        if kind == 'session':
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

    def check_auth_password(self, username, password):
        try:
            LOGINLOG.write(username + ":" + password + "\n")
            LOGINLOG.close()
            return paramiko.AUTH_SUCCESSFULL
        except:
            return paramiko.AUTH_FAILED

    def check_channel_shell_request(self, channel):
        self.te.set()
        return True


    def get_allowed_auths(self, username):
        return 'password'


def ssh_server():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
        s.bind(('', PORT))
    except Exception as e:
        print ('Binding port dan address gagal {}'.format(e))
        traceback.print_exc()
        sys.exit(1)

    while True:
        try:
            s.listen(100)
            print ("	[+] ======================================= [+]")
            print ("	[!]  Semua aksi attacker terekam di honeta.log [!]")
            print ("	[+] ======================================= [+]")
            insock, ip_att = s.accept()
        except Exception as e:
            print ('Gagal menunggu Koneksi dari attacker : {}'.format(e))
            traceback.print_exc()
        FILELOG.write("\n Attacker IP : " + ip_att[0] + "\n" )
        FILELOG.write("Attacker PORT : " + str(ip_att[1]) + "\n")
        FILELOG.write("Waktu Penyerangan : " +str(time.ctime) + "\n")
        FILELOG.write("======================================")
        print ("	[-] Attacker IP : " + ip_att[0])
        print ("	[-] Attacker PORT : " + str(ip_att[1]))
        print ("	[-] Waktu Penyerangan : " + str(time.ctime()))
        print ("	[+] ==================================== [+]")
        try:
            tp = paramiko.Transport(ip_att)
            tp.add_server_key(SSH_KEY)
            tp.local_version = "SSH-2.0-OpenSSH_7.9 Ubuntu"
            serverpalsu = Honeyta()
            try:
                tp.start_server(server=serverpalsu)
            except paramiko.SSHException:
                print ("Error menyambung SSH")
                raise Exception ("Error menyambung SSH")

            ssh_channel = tp.accept(20)
            if ssh_channel is None:
                print("Tidak ada channel SSH")
                raise Exception ("Tidak ada channel SSH")

            serverpalsu.te.wait(10)
            if not serverpalsu.te.is_set():
                print("Tidak ada request pada server")
                raise Exception("Tidak ada request pada shell server")

            try:
                ssh_channel.send("Ubuntu 20.04\r\n\r\n")
                r = True
                while r:
                    ssh_channel.send("$ ")
                    server_command = ""
                    while not server_command.endswith("\r"):
                        tp = ssh_channel.recv(1024)
                        ssh_channel.send(tp)
                        server_command += tp.decode("utf-8")


                    ssh_channel.send("\r\n")
                    server_command = server_command.rstrip()
                    FILELOG.write('IP : ' + str(ip_att[0]) + "\n")
                    FILELOG.write('Time:' + str(time.ctime()) + "\n")
                    FILELOG.write("$ "+ server_command + "\n")
                    print(server_command)
                    if server_command == "exit":
                        r = False
                    else:
                        server_command_handle(server_command, ssh_channel)

            except Exception as e:
                print('Error : {}: {}'.format(e.__class__,e))
                traceback.print_exc()
                try:
                    tp.close()
                except Exception:
                    pass
            ssh_channel.close()
        except Exception as e:
            print('Error : {}: {}'.format(e.__class__, e))
            traceback.print_exc()
            try:
                tp.close()
            except Exception:
                pass



if __name__ == "__main___":
    ssh_server()

