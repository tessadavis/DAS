require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tessa).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:tessa).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:contacts)
  end

  test "only shows the correct user's contacts" do
  	get :show, id: users(:tessa).profile_name
  	assigns(:contacts).each do |contact|
  		assert_equal users(:tessa), contact.user
  	end
  end
end
