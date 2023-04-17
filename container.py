import os
import random
import string
import shelve

cont = shelve.open('cont') # creates shelve store to store object instances of the class + attributes for each container


class Container:
    def __init__(self, name):
        
        self.name = name

        # This block checks ip addresses to set an unused one for new containers
        usedIPaddr = []
        ip = 0
        print(str(len(cont)) + " is the lenghth of the store right now!")
        if len(cont) == 0:
            ip = 1
        else:
            for container in cont:
                usedIPaddr.append(cont[container].addrprefix)
                if container == self.name:
                    ip = cont[container].addrprefix
            if ip == 0:
                ip = max(usedIPaddr) + 1

        
        self.addrprefix = ip
        self.addr = "10.250." + str(ip)

        #Now to set passwords:

        self.passwd = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) # random 10 digit passwd
        self.hash = os.popen("mkpasswd " + self.passwd).read() # Get's unix password hash format, to write in Nixos config


    def print_attributes(self):
        for attribute_name, attribute_value in vars(self).items():
            print(f"{attribute_name}: {attribute_value}")
    
    def create(self):
        for attribute_name, attribute_value in vars(self).items():
            with open(attribute_name, 'w') as file:
                file.write(str(attribute_value))
        # will add extra-container starter here
        # os.system("extra-container create" + container used string var?)
    '''
    def start(self):
        os.system("extra-container start " + self.name)

    def stop(self):
        os.system("extra-container stop " + self.name)  
    '''



        
        



    
