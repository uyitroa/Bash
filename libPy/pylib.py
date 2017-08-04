
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

#if __name__ == '__main__':
#	#list = ['i','am','a','superhero']
#	#convertLstToStr(list, " ")
#	speak("Just do it, i don't even know if it gonna work or not, i just hope that gonna be fine at the moment", 0.1)