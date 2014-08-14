# Survey Page Two Class contains instance variables for all major items to be tested
# If any changes occur on page, this class should be the main place to edit code
require './pages/mainpage.rb'

class SurveyPageTwo < MainPage
	
	attr_reader(:testcase,:textfieldid1,:textfieldid1data,:textareaid1,:textareaid1data,:backbutton,:submitbutton,:browsertext,:screenshot)
	
	def initialize
		# Called when pageobject is instantiated
		# Allows user to input which testcase from CSV they want to use
		print('Enter Testcase for Page Two: ')
		@testcase = gets().to_i
		
		# Optional way to not hard code data file name
		# print('Enter Filename for Page One: ')
		# @filename = gets()
		# Filename for Data
		@filename = './data/surveypagetwodata.csv'
	
		# Run ParseCSVtoVar method when instantiating new Page Object
		self.ParseCSVtoVar(@testcase)
		
		# Element IDs and Names for Page Elements
		# Text Field ID for Place of Preference 
		@textfieldid1 = 'entry_1003805883'
		# Text Area ID for Reason to Travel
		@textareaid1 = 'entry_191453708'
		
		# Back Button Name
		@backbutton = 'back'
		# Submit Button Name
		@submitbutton = 'submit'
		
		# Screenshot FileName
		@screenshot = 'PageTwo.png'
	end		
end