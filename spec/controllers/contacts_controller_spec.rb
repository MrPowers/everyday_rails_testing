require 'spec_helper'

describe ContactsController do
  describe "guest access" do
    describe "GET index" do
      it "renders the index view" do
        get :index
        expect(response).to render_template :index
      end

      it "populates an array of contacts" do
        contact = FactoryGirl.create(:contact)
        get :index
        expect(assigns(:contacts)).to match_array [contact]
      end
    end # end GET index

    describe "GET show" do
      it "renders the show view" do
        contact = FactoryGirl.create(:contact)
        get :show, :id => contact
        expect(response).to render_template :show
      end

      it "assigns the requested contact to @contact" do
        contact = FactoryGirl.create(:contact)
        get :show, :id => contact
        expect(assigns(:contact)).to eq contact
      end
    end # end GET show

    describe "GET new" do
      it "requires login" do
        get :new
        expect(response).to redirect_to login_url
      end
    end #end GET new

  end #end guest access
end























