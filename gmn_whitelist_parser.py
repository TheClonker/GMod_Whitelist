#!/usr/bin/python
# -*- coding: utf-8 -*-

import urllib2
from xml.dom import minidom

gid = '103582791434443354'
file = '/home/gmod/ttt_three/garrysmod/data/gmn/whitelist'

try:
	response = urllib2.urlopen('http://steamcommunity.com/gid/' + gid + '/memberslistxml/?xml=1')

	xmldoc = minidom.parseString(response.read())
	users = xmldoc.getElementsByTagName('steamID64')

	f = open(,'w')
	
	for user in users :
		SteamID = int(user.firstChild.data)
		f.write( str(SteamID) + '\n')
		#print steamID
		
	f.close()
	#print "Wrote " + str(len(users)) + " SteamIDs"
	
except urllib2.HTTPError, e:
    #print e.code
	pass
except urllib2.URLError, e:
    #print e.args
	pass