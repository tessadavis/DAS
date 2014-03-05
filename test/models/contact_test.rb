require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "that a status requires name" do
  	contact = Contact.new
  	assert !contact.save
  	assert !contact.errors[:name].empty?
  end

  test "that a contact's name is at least two lettters" do
  	contact = Contact.new
  	contact.name = "H"
  	assert !contact.save
  	assert !contact.errors[:name].empty?
  end

  test "that a contact has a user id" do
  	contact=Contact.new
  	contact.name="Tessa"
  	assert !contact.save
  	assert !contact.errors[:user_id].empty?
  end

end
