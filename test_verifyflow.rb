# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

# This script checks the flow of the survey and verifies page through browsertext
# Script also takes page shots of each survey page
# Run on testcase 6 in data

require './pages/mainpage.rb'
require './pages/surveypageone.rb'
require './pages/surveypagetwo.rb'
require './pages/surveypagethree.rb'

# Make all Page Objects
b = MainPage.new
t1 = SurveyPageOne.new
t2 = SurveyPageTwo.new
t3 = SurveyPageThree.new

# Start at Survey Page One
# Open Browser

b.open_browser(b)

b.go_to_url(t1.url)

b.input_textfield(t1.textfieldid1,t1.textfieldid1data)
b.input_textfield(t1.textfieldid2,t1.textfieldid2data)
b.select_radio(t1.radioid)
b.select_button(t1.continuebutton) 

# Now on Survey Page Two
# Select Back Button to send User back to Page One
b.select_button(t2.backbutton)

# Check if Page One Text is Correct
if b.verify_browser_text(t1.browsertext)
	puts 'Pass. User on Page One.'
else 
	puts 'Fail. User not on Page One.'
end

# Take Screenshot of Page One
b.save_shot(t1.screenshot)

# Continue to Page Two again
b.select_button(t1.continuebutton)

# Check if Page Two Text is Correct
if b.verify_browser_text(t2.browsertext)
	puts 'Pass. User on Page Two.'
else 
	puts 'Fail. User not on Page Two.'
end

# Take Screenshot of Page Two
b.save_shot(t2.screenshot)

# Select Submit Button to continue to Page Three
b.select_button(t2.submitbutton)

# Check if Page Three Text is Correct
if b.verify_browser_text(t3.browsertext)
	puts 'Pass. User on Page Three.'
else 
	puts 'Fail. User not on Page Three.'
end

# Take Screenshot of Page Three
b.save_shot(t3.screenshot)

# Select Submit another Response Link to go back to Page One
b.select_link(t3.responselink)

# Check if Page One Text is Correct
if b.verify_browser_text(t1.browsertext)
	puts 'Pass. User on Page One.'
	puts ''
else 
	puts 'Fail. User not on Page One.'
	puts ''
end

b.close_browser