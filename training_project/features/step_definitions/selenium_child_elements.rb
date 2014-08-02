And(/^I get the row element$/) do
  # There are multiple elements with that class, we get only the first element at this point
  @div_element = @browser.find_element(:class => "puppy_list")
end

Then(/^I retrieve image child element$/) do
  # Retrieve img element from div
  img_element_by_tag = @div_element.find_element(:tag_name => 'img')
  expect(img_element_by_tag.attribute('alt')).to eql("Brook")
end

Then(/^I retrieve the div and then subsequently the image element$/) do
  # Retrieve another div and then img from that div
  div_element_by_class = @div_element.find_element(:class => 'image')
  img_element_by_class = div_element_by_class.find_element(:tag_name => 'img')
  expect(img_element_by_class.attribute('alt')).to eql("Brook")
end

Then(/^I retrieve the details element$/) do
  #Retrieve details from div row element
  details_element_by_class = @div_element.find_element(:class => "details")
  expect(details_element_by_class.text).to include("Golden Retriever")
end

Then(/^I retrieve the name element$/) do
  # Retrieve name from div
  name_element_by_class = @div_element.find_element(:class => "name")
  expect(name_element_by_class.text).to eql("Brook")
end

Then(/^I retrieve the h4 element$/) do
  #There are two h4's, so retrieve the second one and verify its value
  details_element_by_class = @div_element.find_element(:class => "details")
  h4_details_element = details_element_by_class.find_elements(:tag_name => 'h4')[1]
  expect(h4_details_element.text).to eql("Female")
end