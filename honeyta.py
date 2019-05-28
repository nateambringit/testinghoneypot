import threading
import socket
import sys
import traceback
import paramiko
import logging
import configmail
import smtplib
import pymysql
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


logging.basicConfig(level=logging.DEBUG,
                            format='%(asctime)s %(levelname)-8s %(message)s',
                            datefmt='%Y-%m-%d %H:%M:%s',
                            filename='log/honeyta.log',
                            filemode='a')

LOGINLOG = open("log/login.log","a")

SSH_KEY = paramiko.RSAKey(filename='sshkey/honeyta.key')
PORT = 22
loglock_thread = threading.Lock()

bodymail = "Honeypot mendeteksi ada serangan pada server anda"
subjectmail = "Pemberitahuan Honeypot!"
msg = MIMEMultipart()
msg['From'] = configmail.mailFromAdress
msg['To'] = configmail.mailToAdress
msg['Subject'] = subjectmail
msg.attach(MIMEText(bodymail,'plain'))
message = msg.as_string()

def server_command_handle(server_command, ssh_channel):
    honeydb = pymysql.connect("localhost","skripsi","rahasia","honeydb")
    cursordb = honeydb.cursor()

    cursordb.execute("SELECT * FROM eksekusi WHERE input='" + server_command + "'" )
    data = cursordb.fetchone()
    if data is not None:
        respon = "%s" % data[2]
    else:
        respon = server_command + ": command not found"

    logging.info(respon + "\n")
    ssh_channel.send(respon + "\r\n")

class honeypot_ta(paramiko.ServerInterface):
    def __init__(self):
        self.event = threading.Event()

    def check_channel_request(self, kind, chanid):
        if kind == 'session':
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

    def check_auth_password(self, username, password):
        loglock_thread.acquire()
        try:
            print("[#] Attacker memasukan username & password: " + username + ':' + password + "\n")
            logging.warning(username + ':' + password + "\n")
            LOGINLOG.write(username + ':' + password + "\n")
            if(username == "root") and (password == "password123"):
                return paramiko.AUTH_SUCCESSFUL
        finally:
            loglock_thread.release()
        return paramiko.AUTH_FAILED

    def get_allowed_auths(self, username):
        return 'password'

    def check_channel_shell_request(self, channel):
        self.event.set()
        return True

    def check_channel_pty_request(self, channel, term, width, height, pixelwidth, pixelheight, modes):
        return True


def start_server():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        s.bind(('', PORT))
    except Exception as err:
        print('Binding port dan address gagal: {}'.format(err))
        traceback.print_exc()
        sys.exit(1)

    while True:
        try:
            s.listen(1000)
            print("[+] ======================================================= [+]")
            print("[!] Semua aksi attacker terekam di honeyta.log dan login.log [!]")
            print("[+] ======================================================= [+]")
            insock, ip_att = s.accept()
        except Exception as err:
            print('Gagal menunggu Koneksi dari attacker : {}'.format(err))
            traceback.print_exc()
        except KeyboardInterrupt:
            sys.exit(0)

        logging.info("\n Attacker IP : " + ip_att[0] + "\n")
        logging.info("Attacker PORT : " + str(ip_att[1]) + "\n")

        server = smtplib.SMTP(configmail.mailFromServer)
        server.starttls()
        server.login(configmail.mailFromAdress, configmail.mailFromPassword)
        server.sendmail(configmail.mailFromAdress, configmail.mailToAdress, message)
        server.quit()

        print("[-] Attacker IP : " + ip_att[0])
        print("[-] Attacker PORT : " + str(ip_att[1]))
        print("[+] ========================================== [+]")

        try:
            transport = paramiko.Transport(insock)
            transport.add_server_key(SSH_KEY)
            transport.local_version = "SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3"
            server = honeypot_ta()
            try:
                transport.start_server(server=server)
            except paramiko.SSHException:
                print('Gagal menyambung pada SSH.')

            ssh_channel = transport.accept(20)
            if ssh_channel is None:
                print('SSH channel dan attacker tidak terhubung')

            server.event.wait(10)
            if not server.event.is_set():
                print('Tidak ada request pada server')

            try:
                ssh_channel.send("Ubuntu 18.04\r\n\r\n")
                r = True
                while r:
                    ssh_channel.send("root@taserver:~# ")
                    server_command = ""
                    while not server_command.endswith("\r"):
                        transport = ssh_channel.recv(1024)
                        ssh_channel.send(transport)
                        server_command += transport.decode("utf-8")

                    ssh_channel.send("\r\n")
                    server_command = server_command.rstrip()
                    logging.info('IP : ' + str(ip_att[0]) + "\n")
                    logging.info("Inputan :" + server_command + "\n")
                    print(server_command)
                    if server_command == "exit":
                        r = False
                    else:
                        server_command_handle(server_command, ssh_channel)

            except Exception:
                print('Attacker gagal terkoneksi dengan honeypot')
            try:
                transport.close()
            except Exception:
                pass
            ssh_channel.close()
        except Exception:
            print('Attacker mencoba menyerang menggunakan brute force')
            try:
                transport.close()
            except Exception:
                pass

if __name__ == "__main__":
    start_server()







