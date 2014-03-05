require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:tessa)
    get :new
    assert_response :success
  end

  test "should be logged in to create a contact" do
    post :create, contact: {name: "Mandy"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create contact when logged in" do
    sign_in users(:tessa)
    assert_difference('Contact.count') do
      post :create, contact: { area: @contact.area, category: @contact.category, email: @contact.email, info: @contact.info, name: @contact.name, phone: @contact.phone, website: @contact.website }
    end

    assert_redirected_to contact_path(assigns(:contact))
    assert_equal assigns(:contact).user_id, users(:tessa).id
  end

  test "should create contact for the current user when logged in" do
    sign_in users(:tessa)
    assert_difference('Contact.count') do
      post :create, contact: { area: @contact.area, category: @contact.category, email: @contact.email, info: @contact.info, name: @contact.name, phone: @contact.phone, website: @contact.website, user_id: users(:fergal).id }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:tessa)
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact when logged in" do
    sign_in users(:tessa)
    patch :update, id: @contact, contact: { area: @contact.area, category: @contact.category, email: @contact.email, info: @contact.info, name: @contact.name, phone: @contact.phone, website: @contact.website }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should update contact for the current user when logged in" do
    sign_in users(:tessa)
    patch :update, id: @contact, contact: { area: @contact.area, category: @contact.category, email: @contact.email, info: @contact.info, name: @contact.name, phone: @contact.phone, website: @contact.website, user_id: users(:fergal).id }
    assert_redirected_to contact_path(assigns(:contact))
    assert_equal assigns(:contact).user_id, users(:tessa).id
  end

  test "should not update contact if nothing has changed" do
    sign_in users(:tessa)
    patch :update, id: @contact
    assert_redirected_to contact_path(assigns(:contact))
    assert_equal assigns(:contact).user_id, users(:tessa).id
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
