# Author: Rosalyn Goh
# Created: May 7, 2013
# Last Modified:

# Driver script which can call other scripts to run depending on user input

loop do
	puts "Use testcases 1-4 for Check Data." 
	puts "Testcase 5 for Check Validation."
	puts "Testcase 6 for Check Flow."
	print "Input script to run (Check Data, Check Validation, or Check Flow or Exit to exit script):  "
	input = gets.chomp

	if input.empty?
		puts "No input. Please try again."
	elsif input == 'Check Data'
		system 'ruby test_verifydata.rb'
	elsif input == 'Check Flow'
		system 'ruby test_verifyflow.rb'
	elsif input == 'Check Validation'
		system 'ruby test_verifyvalidationmsg.rb'
	elsif input == 'Exit'
		break
	else
		puts "Invalid input. Input 'Check Data', 'Check Flow', 'Check Validation' or 'Exit' as indicated."
	end
end
