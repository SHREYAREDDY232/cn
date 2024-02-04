import time

def leaky_bucket():
    bucketsize = int(input("Enter bucket size: "))
    outgoing = int(input("Enter outgoing rate: "))
    n = int(input("Enter the number of inputs: "))
    store = 0

    while n != 0:
        incoming = int(input("Incoming size is: "))
        print("Bucket buffer size is {} out of {}".format(store, bucketsize))
        if incoming <= (bucketsize - store):
            store += incoming
            print("Bucket buffer size is {} out of {}".format(store, bucketsize))
        else:
            print("Packet loss: {}".format(incoming - (bucketsize - store)))
            store = bucketsize
            print("Bucket buffer size is {} out of {}".format(store, bucketsize))
        
        if store < outgoing:
            print("After outgoing: 0 packets left out of {} in buffer".format(bucketsize))
            store = 0
        else:
            store -= outgoing
            print("After outgoing: {} packets left out of {} in buffer".format(store, bucketsize))
        
        n -= 1
        time.sleep(3)

if _name_ == "_main_":
    leaky_bucket()
