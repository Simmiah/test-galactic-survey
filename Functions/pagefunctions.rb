# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

# Reusable Module that contains global Browser Functions
# Instance variables are instantiated in each tested page's class so they can be modified by page
# Example: provided for each method to display sample code to call method from script

module PageFunctions
	
	# Input Text Field by TextFieldID with testdata (will be passed in from file)
	# Parameters: ID from Text Field in Page Object
	# Example: pageobject.input_textfield(pageobject.textfieldid)
	def input_textfield (textfieldid,testdata)
		@textfield = @browser.text_field :id => textfieldid
		@textfield.set testdata
	end
	
	# Input Text Area 
	# Parameters: ID for Text Area from Page Object
	# Example: pageobject.input_textarea (pageobject.textareaid)
	def input_textarea (textareaid,testdata)
		@textarea = @browser.textarea :id => textareaid
		@textarea.set testdata
	end
	
	# Select Button by ButtonName
	# Parameters: Button Name from Page Object
	# Example: pageobject.select_button(pageobject.buttonid)
	def select_button (buttonattr)
		@button = @browser.button :name => buttonattr
		@button.click
	end
	
	# Select Radio Button
	# Parameters: Radio Button ID from Page Object
	# Example: pageobject.select_radio(pageobject.radioid)
	def select_radio (radioid)
		@radio = @browser.radio :id => radioid
		@radio.set
	end
	
	# Select Link by Text
	# Parameters: Link Text from Page Object
	# Example: pageobject.select_link(pageobject.linktext)
	def select_link (linktext)
		@link = @browser.link :text => linktext
		@link.click
	end
	
	# Open Browser Functions
	# Open Internet Explorer window
	# Parameters: None
	# Example: pageobject.open_browser_ie
	def open_browser_ie 
		require 'watir-webdriver'
		@browser = Watir::Browser.new :ie
	end
	
	# Open Firefox Browser window
	# Parameters: None
	# Example: pageobject.open_browser_ff
	def open_browser_ff
		require 'watir-webdriver'
		@browser = Watir::Browser.new :ff
	end
	
	# Open Chrome Browser window
	# Parameters: None
	# Example: pageobject.open_browser_chrome
	def open_browser_chrome
		require 'watir-webdriver'
		@browser = Watir::Browser.new :chrome
	end
	
	# Prompts user which browser they want to run script on
	# Parameters: Page Object
	# Example: b.open_browser(pageobject)
	def open_browser (browser)
		loop do
		  print "Input browser (IE or FF or Chrome):  "
		  browser = gets.chomp

		  if browser.empty?
			puts "No input."
		  elsif (browser == 'IE') or (browser == 'FF') or (browser == 'Chrome')
			break
		  else
			puts "Invalid input. Input IE or FF or Chrome as indicated."
		  end
		end

		case 
			when browser == 'IE'
				self.open_browser_ie
			when browser == 'FF'
				self.open_browser_ff
			else browser == 'Chrome'
				self.open_browser_chrome
		end
	end
	
	# Check Browser Text 
	# Parameters: Browsertext from Page Object
	# Example: pageobject.verify_browser_text(pageobject.browsertext)
	def verify_browser_text (browsertext)
		@browser.text.include? (browsertext)
	end
	
	# Other Browser Methods
	# Method to load global URL from Tested Page Object
	# Parameters: URL from Page Object
	# Example: pageobject.go_to_url (pageobject.url)
	def go_to_url (url)
		@browser.goto (url)
	end
	
	# Close Browser method 
	# Parameters: None
	# Example: pageobject.close_browser
	def close_browser
		@browser.close
	end
	
	# Take Snapshot of Page
	# Parameters: Screenshot File Name from Page Object
	# Example: pageobject.savescreen(pageobject.screenshot)
	def save_shot(screenshot)
		@browser.screenshot.save(screenshot)
	end
end


