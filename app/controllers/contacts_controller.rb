class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.find(:all, :order => 'name')
    
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  def listarea
    @listarea = Contact.order(:area).uniq.pluck(:area)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  def areacontact
    @contacts =  Contact.order(:name).find_all_by_area(params[:area])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end 
  end

  # GET /contacts/new
  def new
    @contact = current_user.contacts.new
    @contact.build_document

  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = current_user.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    def contact_params
      params.require(:contact).permit(:name, :email, :category, :area, :organisation, :website, :phone, :user_id, :document_attributes) if params[:contact]
    end
    
    @contact = current_user.contacts.find(params[:id])
    if params[:contact] && params[:contact].has_key?(:user_id)
      params[:contact].delete(:user_id) 
    end
    respond_to do |format|
      if @contact.update((contact_params))
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end

  end

  

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :category, :area, :phone, :website, :email, :info, :user_id, :document_attributes)
    end
end
