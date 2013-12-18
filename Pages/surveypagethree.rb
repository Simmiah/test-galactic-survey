# Survey Page Two Class contains instance variables for all major items to be tested
# If any changes occur on page, this class should be the main place to edit code
require './pages/mainpage.rb'

class SurveyPageThree < MainPage
	attr_reader(:responselink,:browsertext,:screenshot)
	
	def initialize
		# Called when pageobject is instantiated
		# Allows user to input which testcase from CSV they want to use
		print('Enter Testcase for Page Three: ')
		@testcase = gets().to_i
		
		# Optional way to not hard code data file name
		# print('Enter Filename for Page One: ')
		# @filename = gets()
		# Filename for Data
		@filename = './data/surveypagethreedata.csv'
	
		# Run ParseCSVtoVar method when instantiating new Page Object
		self.ParseCSVtoVar(@testcase)
		
		# Element Attributes for Page Elements
		# Link Text for Submit another Response
		@responselink = 'Submit another response'
		
		# Screenshot Filename
		@screenshot = 'PageThree.png'
	end
	
end