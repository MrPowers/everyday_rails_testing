require 'spec_helper'

describe MessagesController do

  describe "GET #index" do
    it "populate an array of messages" do
      message = FactoryGirl.create(:message)
      get :index
      expect(assigns(:messages)).to match_array [message]
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it 'it assigns the requested method to @message' do
      message = FactoryGirl.create(:message)
      get :show, :id => message
      expect(assigns(:message)).to eq message
    end

    it 'renders the show template' do
      message = FactoryGirl.create(:message)
      get :show, :id => message
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new message to @message' do
      get :new
      expect(assigns(:message)).to be_a_new(Message)
    end

    it 'renders the new tempate' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested message to @message" do
      message = FactoryGirl.create(:message)
      get :edit, :id => message
      expect(assigns(:message)).to eq message
    end

    it 'renders the edit template' do
      message = FactoryGirl.create(:message)
      get :edit, :id => message
      expect(response).to render_template :edit
    end
  end


  describe 'POST #create' do
    context "with valid attributes" do
      it 'saves new messages in the database' do
        expect{
          post :create, :message => FactoryGirl.attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it 'redirects to the message show page' do
        post :create, :message => FactoryGirl.attributes_for(:message)
        expect(response).to redirect_to assigns(:message)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the message' do
        expect{
          post :create, :message => FactoryGirl.attributes_for(:invalid_message)
        }.to change(Message, :count).by(0)
      end

      it 're-renders the new view' do
        post :create, :message => FactoryGirl.attributes_for(:invalid_message)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @message = FactoryGirl.create(:message,
        :name => "Bob Loblaw",
        :email => "bob@lob.com"
      )
    end

    it "locates the requested message" do
      put :update, 
          :id => @message, 
          :message => FactoryGirl.attributes_for(:message)
      expect(assigns(:message)).to eq(@message)
    end

    context 'valid attributes' do
      it 'changes @messages attributes' do
        put :update,
            :id => @message,
            :message => FactoryGirl.attributes_for(:message, :name => "Crazy 8")
        @message.reload
        expect(@message.name).to eq("Crazy 8")
      end

      it 'redirects to the updated message' do
        put :update,
            :id => @message,
            :message => FactoryGirl.attributes_for(:message)
        expect(response).to redirect_to @message
      end
    end

    context 'invalid attributes' do
      it 'does not change @message\'s attributes' do
        put :update,
            :id => @message,
            :message => FactoryGirl.attributes_for(:message, :email => nil)
        @message.reload
        expect(@message.email).to_not be_nil
      end

      it 're-renders the edit template' do
        put :update,
            :id => @message,
            :message => FactoryGirl.attributes_for(:invalid_message)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @message = FactoryGirl.create(:message)
    end

    it "deletes the message" do
      expect{
        delete :destroy, :id => @message
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the messages#index page" do
      delete :destroy, :id => @message
      expect(response).to redirect_to messages_path
    end
  end

end