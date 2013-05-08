# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

This miniature automation framework was a way for me to learn some basic automation framework concepts.
It utilizes some ideas from data driven, to keyword, to page object framework ideas to test a basic google form.
This framework is built using Ruby and utilizes Watir.  I also utilized the Google-Drive rubygem.

I have separated out the main folder into several folders:
1. Pages
2. Functions
3. Data

The main folder contains the Test Scripts all marked beginning with "test_"
There is also a driver.rb file that contains code to prompt user for which script to run.

The motivation behind this was to learn what can work and cannot work to make a framework more maintainable.
I realized very quickly after reading several tutorials that even data driven and keyword frameworks can result in 
difficult to maintain code.  I do not believe I have solved all the difficulties in code maintenance in this framework
but I understand the challenges better than when I first started.

Examples of updates to webpages include:
1. Adding new text field
2. Adding a new page
3. Changing existing flow of web pages

It became clear to me that if you write a flat file test script, it is very brittle.  If I were to update say
a web page flow I would have to rewrite my entire script.  The idea behind abstracting out the various pieces of
my automation code is so that I will only have to update select pieces and not require as much maintenance.

TESTED FORM

Google Survey Url: https://docs.google.com/forms/d/1l7XjlXQRnyNk-qMUhuprYs9uKpg9fyOQNXZDpHHeUH8/viewform
Google Survey Spreadsheet: https://docs.google.com/spreadsheet/ccc?key=0AqmxR49Mk_X6dHVYbmpPaUVSUmxqNVg5clc0ajdib0E#gid=0

PAGE OBJECTS

I saw that many people were tossing around the 'page object' idea and I even checked out the code of existing page object 
helpers which utilize Watir and Cucumber.

I wanted to learn how this could work myself so I set out to create a mini framework which you see here.

The idea behind page object is that certain page elements information are stored in each page class.  In the pages folder 
you will see multiple pages (surveypageone, surveypagetwo...) which represent each page in my survey.  They each contain
the url, various element attributes such as IDs or name or text to identify the element with.  In surveypageone.rb I
also included basic logic to identify which radio button to select based on data coming in from my data file.  Other than
that the code is pretty basic and speaks for itself.

I did also include a mainpage file which includes both function modules (read below) to allow some inheritability.
You can reuse a mainpage class if you have multiple pages which reuse the same element or text or etc. 

Now you may ask, how on earth do you use this information to run an actual test script?  Functions!


DATA AND PAGE FUNCTIONS

In my Functions folder you will see two files, datafunctions and pagefunctions.  Each file contains functions for either
data or page navigation as indicated by the filename.  

These functions can interact with the various page object element attributes or the CSV data files and are reusable.  
The ParseCSVtoVar function in datafunctions is reusable with CSV files of multiple lengths and can create instance variables
for each page object utilizing the function automatically making it use the data I am passing in.

I did not take the time out to really make the CompareData functions more reusable.  This may be something I will work
on in the future but for now it works.  Because of this I had a separate CompareData functions for Page one and two of
my survey.

The page navigation functions are all reusable.  I also have an open_browser function which prompts the user for which browser
they want to run the scripts in, then calls the correct page function for the browser such as open_browser_ie.

I learned about some quirks with Watir that I have yet to code around here.  I realized if you want to make a 
reusable function such as select_button that can be used for both the user passing in the ID or Name, this can cause
some issues.  I am sure there is a solution out there but for now I used element attributes that tend to not
change such as ID or Name.


DATA FILES

In my Data folder there are several CSV files, one for each page of the survey.  I made sure to separate them into
testcases by row and indicated in the commenting and driver file which testcase is made for which file.  

I was able to make it so passing in null values does not cause any negative issues in running the test scripts.
These files are passed in when each page object is instantiated in each test script.  It is possible to have code
where the user is prompted to pass in a different file in and that is available in each page class' comments.


DRIVER

I wrote a driver.bat file which calls the driver.rb file which contains a loop which prompts the user for which 
test script they wish to run or if they wish to exit.  I made sure that the input is validated and only allows
the values I ask for.  


TEST SCRIPTS

I have several test scripts: test_verifyvalidationmsg, test_verifyflow, test_verifydata which are to test verifying
a required fields validation message, verify the page flow when the user navigates back and forth, and finally tests
that the data inputted is the data retrieved from the google spreadsheet created from the submission.

I was not able to write a great teardown script to delete my old data because it seems like the delete sheet function is not
working at the moment for the google-drive gem.  Otherwise that the entire verifydata.rb script would have been completely
automated.  Right now the user has to delete all the old data from the sheet before running verifydata.


CONCLUSION

So that is the general overview of my framework in a nutshell!  I have added a lot of comments in my code which
let the user know how to use each function in a script and what parameters are needed.  Please read the comments
for more detailed information on my implementation of these concepts.

I learned that it is easy to write a flat file test script.  It is much harder to figure out how to abstract out a 
function such as parsing a CSV into instance variables in a reusable manner.  That is the hardest part of
creating the framework.  The concepts themselves are fairly easier to understand.

I was able to see how much easier maintaining the code is when I had to transfer my google form to a new email address.
I only had to update my page object element attributes and the url for the spreadsheet in my comparedata functions.  
I did not have to update my test scripts, my functions, or my data csv files.  

Example of Watir Ruby Script vs. my Test Script inputting in a text area:
WATIR 
	testdata = 'testdata'
	textareaid = 'id of text data'
	@textarea = @browser.textarea :id => textareaid
	@textarea.set testdata
MY TEST SCRIPT (where b = MainPage.new and t2 = SurveyPageTwo.new)
	b.input_textfield(t2.textfieldid1,t2.textfieldid1data)

By isolating out my individual pieces: element attributes, functions, testdata I make it easier on myself to alter
code when needed and additionally my test scripts are easier to read.


TO CREATE A NEW PAGE USING MY FRAMEWORK

Create a page that inherits from mainpage.  Add any instance variables in the def initialize for element attributes in
your tested page.  If you are passing in data make sure to call ParseCSVtoVar in your def initialize.  

You should be able to write a test script using the examples as listed in my datafunctions and pagefunctions code.


This was a fun exercise!  I picked up Ruby as a part of this project and have come to really enjoy working with this language.
Some noted quirks:
1. Closing Chrome browser is having issues
2. Sometimes the verifyflow.rb errors out possibly due to needing some wait time before calling next function