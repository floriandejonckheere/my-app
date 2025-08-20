# frozen_string_literal: true

RSpec.describe "/sign_in" do
  let(:user) { create(:user) }

  describe "POST /sign_in" do
    it "signs in" do
      user.update! password: "password"

      post sign_in_path, params: { user: { email: user.email, password: "password" } }

      expect(response).to redirect_to dashboard_path
    end

    context "when the email is invalid" do
      it "does not sign in" do
        post sign_in_path, params: { user: { email: "test@test.com", password: "password" } }

        expect(response).to redirect_to sign_in_path
      end
    end

    context "when the password is invalid" do
      it "does not sign in" do
        post sign_in_path, params: { user: { email: user.email, password: "password" } }

        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe "DELETE /sign_out" do
    it "signs out" do
      sign_in user

      delete sign_out_path

      expect(response).to redirect_to root_path
    end
  end
end
