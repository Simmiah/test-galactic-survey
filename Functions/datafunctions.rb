# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

# Reusable DataStuff module to contain Data Related Functions for Scripts
# Example: Provided for each method here that is used in scripts to demonstrate how to call method

require 'csv'
require 'google_drive'

module DataStuff	

	# Reusable Function to easily work with CSV files in this format:
	# CSV File Format Must Be: Key1, Value1, Key2, Value2, Key3, Value3
	# Passes in CSV file (@filename) and converts into Array of Arrays
	# Flattens array of arrays then converts into Hash by Testcase Number
	
	# Parameters: Testcase Number from CSV File
	# Example: Currently utilized when each page object is created to pass in data so do not call from script
	def ParseCSVtoVar(testcase)
		array_of_arrays = CSV.read(@filename)
		# Flatten Array and Convert into Hash Key => Value pairs 
		# Pass Hash into Loop to set each Key as instance variable == Value
		datahash = Hash[*array_of_arrays[testcase].flatten]
		datahash.each do |k,v|
			instance_variable_set("@#{k}", v)
		end
	end
	
	# CompareDataOne and CompareDataTwo: Get data from Google Docs and Compares to Values from ParseCSVtoVar function 
	# Cannot currently delete spreadsheet so workaround for teardown data is listed below
	# *Please delete rows of data from spreadsheet before running CompareData Functions*

	# Compares Data for Page One
	# Connect to Google Docs, retrieves data, compares with page object data from ParseCSVtoVar 
	# Please replace username@gmail & password with your valid google credentials
	
	# Parameters: Data Variable from ParseCSVtoVar for Text1, Text2, Radiobutton
	# Example: pageobject.CompareDataOne(pageobject.text1data,pageobject.text2data,pageobject.radio)
	def comparedataone(formtext1,formtext2,radiocheck)
		
		# Connect to Google Spreadsheet and gets Data
		session = GoogleDrive.login("rosalyntest@gmail.com", "Kiana5852")
		sheet = session.spreadsheet_by_url('https://docs.google.com/spreadsheet/ccc?key=0AqmxR49Mk_X6dHVYbmpPaUVSUmxqNVg5clc0ajdib0E#gid=0').worksheets[0]
		
		# Page One Data Instance Variables
		textid1data = sheet[2,2]
		textid2data = sheet[2,3]
		radioiddata = sheet[2,4]
		
		# Loops to check if Text and Radio data is same as inputted in script
		if formtext1 == textid1data and formtext2 == textid2data
			puts 'Page One Text Data is same as entered. :)'
		else 
			puts 'Page One Text Data is not same as entered. Fail.'
		end
		
		if radioiddata.include? 'Pyramids' and radiocheck == 'Pyramids'
			puts 'Page One Radio is same as entered. :)'
		elsif radioiddata.include? 'Stonehenge' and radiocheck == 'Stonehenge'
			puts 'Page One Radio is same as entered. :)'
		elsif radioiddata.include? 'Las Vegas' and radiocheck == 'Las Vegas'
			puts 'Page One Radio is same as entered. :)'
		elsif radioiddata.include? 'Antarctica' and radiocheck == 'Antarctica'
			puts 'Page One Radio is same as entered. :)'
		else 
			puts 'Page One Radio is not same as entered. Fail.'
		end
	end
	
	# Compares Data for Page Two
	# Connect to Google Docs, retrieves data, compares with page object data from ParseCSVtoVar 
	# Please replace username@gmail & password with your valid google credentials
	
	# Parameters: Data Variable from ParseCSVtoVar for Text1, Text1Area
	# Example: pageobject.CompareDataOne(pageobject.text1data,pageobject.text2data,pageobject.radio)
	def comparedatatwo(formtext1,formtextarea1)
		# Connect to Google Spreadsheet and Gets Data
		session = GoogleDrive.login("rosalyntest@gmail.com", "Kiana5852")
		sheet = session.spreadsheet_by_url('https://docs.google.com/spreadsheet/ccc?key=0AqmxR49Mk_X6dHVYbmpPaUVSUmxqNVg5clc0ajdib0E#gid=0').worksheets[0]
		
		# Page Two Data Instance Variables
		textid1data = sheet[2,5]
		areaid1data = sheet[2,6]
	
		# Checks if data same as inputted in script
		if textid1data == textfieldid1data and areaid1data = textareaid1data
			puts 'Page Two Text Data same as entered. :)'
			puts ''
		else
			puts 'Page Two Text Data not same as entered. Fail.'
			puts ''
		end
	end	
end