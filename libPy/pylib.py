
def convertLstToStr(list,separed): #To convert list to string, i mean that all the element will be separated by something and set it to a string
	string = ''
	for x in range(len(list)): #Check every element
		string += str(list[x]) + separed #Add it to the string , with something separeted them
	return string #return shit

def getPosOf(string,list): #it's just to find the position of an element of the list
	for x in range(len(list)): #Check every element
		if string == list[x]: #If its the element
			return x #Return the position

def locateMe():# Idk how to locate with python exactyl, so what i do is check a web the scrap it, to get the location, not bad right?
	import urllib2 # importing stuff
	from bs4 import BeautifulSoup
	link = 'https://weather.com/weather/today/l/44.73,-0.44?temp=c' #Web to scrap
	page = urllib2.urlopen(link) #Page script
	soup = BeautifulSoup(page, "html.parser") 
	stringLocate = soup.header.span.div.h1.text #Take the string's location from web
	listLocate = stringLocate.split(', ') #Split it : City, Country
	location = listLocate[0] + ", " + listLocate[1] # Set it to a string
	return location #return bullshit

def speak(firstline,tim): # Function to print but flush, and with time.sleep for each character.
		import time #Importing stuff
		import sys
		for x in range(len(firstline)): #Check for each character of string
			sys.stdout.write(firstline[x]) #Write it without new line
			sys.stdout.flush() #Flush it
			time.sleep(tim) #Set a time between each character

def day_passed(g,timeQues): #Function to check if x day passed since timeQues
	import time #import time to check actual day
	month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"] #List of month
	max_day = [31,29,31,30,31,30,31,31,30,31,30,31] #List of max day of spesific day
	data = timeQues.split(" ") #Fri Jul 31 2017 -> ["Fri","Jul","31","Jul"], to check months and other stuff
	now = time.asctime(time.localtime(time.time())) # #Check our real time now
	tim = now.split(" ") #Convert it to list
	#tim = ["Fri", "Jul" ,"31", "2017"]
	for x in range(len(data)): #Check if there is some blank element
		if data[x] == '': #If there is
			data.remove(data[x]) #Remove it
			break #Then break the for loop to avoid the list out of range error
	for x in range(len(tim)): #check the tim list too
		if tim[x] == '':
			tim.remove(tim[x])
			break
	#print data
	if data[len(data) - 1] == tim[len(tim) - 1]: # if it's the same year
		for y in range(len(max_day)): #loop to check if it's the last day of the previous month, to do another calcul
			if max_day[y] == int(data[2]): #check if it's the last day
				if month[y] == data[1]: #The if it's the previos month
					if int(tim[2]) - 1 >= g - 1: #Check if enough days passed
						return True 
			if month[y] == data[1]:#check the month of timeQues
				pos = y #Get the position of the month's element of the list'month
		if tim[1] == data[1]: #If it's the same month
			if int(tim[2]) - int(data[2]) >= g: #Check enough day passed
				return True
		elif month[pos + 1] == data[1]: # If it's the previous month but not the LAST DAY
			if (max_day - data[2]) + tim[2] >= g: # If last dayS of the month + now to see if it's enough
				return True
		else: #If it's not the previous month
			for x in range(pos + 1): #loop to check if all precedents monthS
				if month[x] == data[1]: #If it is, it means days passed is at least 30 days so we need to return
					return True
	else: #If it's not the same year
		if int(data[len(data) - 1]) < int(tim[len(tim) - 1]) - 1: #check if it's not the previous year, ex: 2017 and 2015, so days passed is at least 365 days
				return True
		elif int(data[len(data) - 1]) < int(tim[len(tim) - 1]): #if it's the previous year
			if data[1] != "Dec": # If it's not december (last month of year), so days passed is at least 30 days
				return True
			else: #If it is the december
				if tim[1] == "Jan":  #If it's January
					if (31 - int(data[2])) + int(tim[2]) >= g: #Then check just like line 60-62 :)
						return True
				else: # If it's not January, that means at least 30 days is passed
					return True

	return False

#if __name__ == '__main__':
#	tim = "Fri Dec 31 2016"
#	print day_passed(10,tim)
#	speak("Just do it, i don't even know if it gonna work or not, i just hope that gonna be fine at the moment", 0.1)