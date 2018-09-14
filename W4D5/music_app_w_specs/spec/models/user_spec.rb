require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "yadayada@yahoo.com",
      password: "qwerty123")
  end

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password)}
  end

  context "model methods"
  describe "#is_password?" do
    it "makes sure a password is correct" do
      expect(user.is_password?).to be true
    end
  end

  describe "#reset_session_token" do
    it "changes the sesion token"

  end

  describe "::find_by_credentials" do
    it "locates the user"
  end
end
