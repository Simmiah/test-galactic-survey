To use this repository just download and run driver.bat file on windows or run driver.rb from mac.  You can also run each test
script individually.  

For information on Watir go to this link:  http://watir.com/

TESTED FORM

Google Survey Url: https://docs.google.com/forms/d/1l7XjlXQRnyNk-qMUhuprYs9uKpg9fyOQNXZDpHHeUH8/viewform
Google Survey Spreadsheet: https://docs.google.com/spreadsheet/ccc?key=0AqmxR49Mk_X6dHVYbmpPaUVSUmxqNVg5clc0ajdib0E#gid=0

Run driver.rb to test the form
=======
Works with Ruby 2.0.0-p353.  Gems are managed by bundler, otherwise install the gems as listed in the gemfile.

For information on Watir go to this link:  http://watir.com/

On Mac OS X 10.9.4
1. brew install rbenv
2. gem install bundler
3. bundle install from cloned repository

If you see the error message "unable to find the chromedriver executable" when running Chrome go here and download chromedriver and place it in your system path.
https://code.google.com/p/selenium/wiki/ChromeDriver

If you see the error message "Protected mode must be set to the same value for all zones" when running IE, go to IE -> wrench -> Internet Options -> Security. Enable protected mode for Local intranet and Trusted sites and close browser.

TESTED FORM

Google Survey Url: https://docs.google.com/forms/d/1l7XjlXQRnyNk-qMUhuprYs9uKpg9fyOQNXZDpHHeUH8/viewform

(Clear this out before running any tests)
Google Survey Spreadsheet: https://docs.google.com/spreadsheet/ccc?key=0AqmxR49Mk_X6dHVYbmpPaUVSUmxqNVg5clc0ajdib0E#gid=0

TO CREATE A NEW PAGE USING MY FRAMEWORK

Create a page that inherits from mainpage.  Add any instance variables in the def initialize for element attributes in
your tested page.  If you are passing in data make sure to call ParseCSVtoVar in your def initialize.  

You should be able to write a test script using the examples as listed in my datafunctions and pagefunctions code.

This was a fun exercise!  I picked up Ruby as a part of this project and have come to really enjoy working with this language.
Some noted quirks:
1. Closing Chrome browser is having issues
2. Sometimes the verifyflow.rb errors out possibly due to needing some wait time before calling next function
