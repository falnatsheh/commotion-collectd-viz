from random import triangular
from time import time
import json
import sys,os

NW= (40.685682,-74.023439)
SE= (40.665828,-73.994815)

def makeInt(fn):
	def returned():
		return int(fn())
	return returned

def makeRandomLocation():
	lat = triangular(NW[0],SE[0])
	lng = triangular(NW[1],SE[1])
	return (lat,lng)

@makeInt
def getUnixMillis():
	return time()*1000

@makeInt
def getRandomNumberOfUsers():
	return triangular(0,30)

def makeRandomNodeReading(i):
	loc = makeRandomLocation();
	return {'nodeID': i, 'lat' : loc[0], 'lng': loc[1], 'time': getUnixMillis(), 'connDevicesCount' : getRandomNumberOfUsers() }


def main():
	devList = [makeRandomNodeReading(i) for i in xrange(15)]
	for i in xrange(len(devList)):
		print json.dumps(devList[i]),
		print ',' if i < len(devList) - 1 else ' ' 

if __name__ == '__main__':
	main()