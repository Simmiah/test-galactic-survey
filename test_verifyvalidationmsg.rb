# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

# This script verifies survey page one's required field validation message 
# Run on testcase 5 in data

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
# Select Continue Button without entering any Input
b.select_button(t1.continuebutton) 

# Check text for validation message text
if b.verify_browser_text(t1.browsertext)
	puts 'Validation message displays as expected. Pass.'
	puts ''
else 
	puts 'Fail. Validation message does not display as expected.'
	puts ''
end

b.close_browser