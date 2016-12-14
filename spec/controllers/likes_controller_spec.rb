require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    user = create_user
    secret = user.secrets.create(content: "secret")
    @like = user.likes.create(user: user, secret: secret)
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it 'not displaying the button on the index page' do
      visit '/secrets'
      expect(page).not_to have_button('Like')
      expect(page).not_to have_button('Unlike')
    end
    # it "cannot access create" do
    #   post :create
    #   expect(response).to redirect_to("/sessions/new")
    # end
    #
    # it "cannot access destroy" do
    #   delete :destroy, id: @like
    # end
  end
end
