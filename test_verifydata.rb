# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

# This script inputs all fields in survey to allow for verification of data input
# Run on testcases 1-4 on data files

require './pages/mainpage.rb'
require './pages/surveypageone.rb'
require './pages/surveypagetwo.rb'

# Make all Page Objects
b = MainPage.new
t1 = SurveyPageOne.new
t2 = SurveyPageTwo.new

# Start at Survey Page One
# Open Browser

b.open_browser(b)

b.go_to_url(t1.url)

b.input_textfield(t1.textfieldid1,t1.textfieldid1data)
b.input_textfield(t1.textfieldid2,t1.textfieldid2data)
b.select_radio(t1.radioid)
b.select_button(t1.continuebutton) 

# Now on Survey Page Two
b.input_textfield(t2.textfieldid1,t2.textfieldid1data)
b.input_textarea(t2.textareaid1,t2.textareaid1data)
# Submit Data
b.select_button(t2.submitbutton)
# Close Browser
b.close_browser

# Check if Data is Same as Input
# Will output to prompt if data matches or does not match
t1.comparedataone(t1.textfieldid1data,t1.textfieldid2data,t1.radiocheck)
t2.comparedatatwo(t2.textfieldid1data,t2.textareaid1data)