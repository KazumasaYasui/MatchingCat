module ControllerMacros
  def login_user
    before(:each) do
      allow(controller).to receive(:authenticate_user!).and_return true
      allow(controller).to receive(:current_user).and_return(user)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(:user)
    end
  end
end
