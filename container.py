import os
import random
import string
import shelve

#cont = shelve.open['cont'] # creates shelve store to store object instances of the class + attributes for each container


class Container:
    def __init__(self, name, addrprefix, addr, passwd, hash):
        
        self.name = name

        # This block checks ip addresses to set an unused one for new containers
        for container in cont:
            usedIPaddr = []
            usedIPaddr.append(container.addrprefix)
        if len(usedIPaddr) == 0:
            ip = 1
        else:
            ip = max(usedIPaddr) + 1

        
        self.addrprefix = ip
        self.addrprefix = addrprefix
        self.addr = "10.250" + string(ip)
        self.addr = addr

        #Now to set passwords:

        self.passwd = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) # random 10 digit passwd
        self.passwd = passwd
        self.hash = os.system("mkpasswd " + passwd) # Get's unix password hash format, to write in Nixos config
        self.hash = hash
        

        self.passwd = passwd


        
        



    
