Given /^I upload a valid file to "(.*)"$/ do |field|
  file_name = File.join(RAILS_ROOT, 'features', 'upload-files', '5.jpg')
  When("I attach the file \"#{file_name}\" to \"#{field}\"")
end
