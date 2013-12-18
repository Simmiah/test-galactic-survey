# Survey Page One Class contains instance variables for all major items to be tested
# If any changes occur on page, this class should be the main place to edit code
require './pages/mainpage.rb'

class SurveyPageOne < MainPage

	attr_reader(:url,:testcase,:textfieldid1,:textfieldid1data,:textfieldid2,:textfieldid2data,:radioid,:radiocheck,:continuebutton,:browsertext,:screenshot)
	
	def initialize
		# Called when pageobject is instantiated
		# Allows user to input which testcase from CSV they want to use
		print('Enter Testcase for Page One: ')
		@testcase = gets().to_i
		
		# Optional way to not hard code data file name
		# print('Enter Filename for Page One: ')
		# @filename = gets()
		# Filename for Data
		@filename = './data/surveypageonedata.csv'
	
		# Run ParseCSVtoVar method when instantiating new Page Object
		self.ParseCSVtoVar(@testcase)
		
		# Element IDs and Names for Page Elements
		# Set Url -- Create different @url's for different environments 
		# Can also add loop to prompt user for which URL to test similar to loop prompting user for browser pref
		@url = 'https://docs.google.com/forms/d/1l7XjlXQRnyNk-qMUhuprYs9uKpg9fyOQNXZDpHHeUH8/viewform'
		@exampleurlforstg = 'https://staging.google.com'
		
		# Text Field ID for Name
		@textfieldid1 = 'entry_635440033'
		# Text Field ID for Place of Origin
		@textfieldid2 = 'entry_1495848353'
		
		# Select one radio button in Test Scripts
		# Radio Button One for Pyramids
		@radioid1 = 'group_1295795931_1'
		# Radio Button Two for Stonehenge
		@radioid2 = 'group_1295795931_2'
		# Radio Button Three for Las Vegas 
		@radioid3 = 'group_1295795931_3'
		# Radio button Four for Antarctica
		@radioid4 = 'group_1295795931_4'
		
		# Run SetRadioButton method when instantiating new Page Object
		self.SetRadioButton(self.radioid)
		
		# Continue Button Name
		@continuebutton = 'continue'
		
		# Screenshot Filename
		@screenshot = 'PageOne.png'
	end
	
	# Select RadioID element ID to RadioID from CSV file
	# First process CSV file with ParseCSVtoVar then pass in @radioid into method
	# Running this method when initializing object for simplicity's sake
	# @radiocheck is for comparedatatwo method to validate radioid is same as input
	# See DataFunctions.rb for more code
	def SetRadioButton(radioidfromhash)
		case
			when radioidfromhash == 'radioid1'
				@radioid = @radioid1
				@radiocheck = 'Pyramids'
			when radioidfromhash == 'radioid2'
				@radioid = @radioid2
				@radiocheck = 'Stonehenge'
			when radioidfromhash == 'radioid3'
				@radioid = @radioid3
				@radiocheck = 'Las Vegas'
			when radioidfromhash == 'radioid4'
				@radioid = @radioid4
				@radiocheck = 'Antarctica'
		end
	end
end




