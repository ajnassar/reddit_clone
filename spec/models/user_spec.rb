require 'spec_helper'

describe User do
  context "mass assignment" do
    it "should fail wihtout :username" do
      user = User.create(password: "asdfgh")
      expect(user.errors.full_messages).to include("Username can't be blank")
    end

    it "should fail without :password" do
      user = User.create(username: "asdfgh")
      expect(user.errors_on(:password)).to include("can't be blank")
    end

    it "should pass with username and valid password" do
      user = User.create(password: "asdfgh", username: "asdf")
      expect(user.errors.full_messages).to eq([])
    end

    it "should receive a session token" do
      user = User.create(password: "asdfgh", username: "asdf")
      expect(user.session_token).to_not be_nil
    end

    it "should have a password_digest" do
      user = User.create(password: "asdfgh", username: "asdf")
      expect(user.password_digest).to_not be_nil
    end
  end

  context "Associations: " do
    it {should have_many(:links)}
    it {should have_many(:moderated_subs)}
    it {should have_many(:comments)}
  end

  context "Find By Credentials: " do
    before(:each) do
      user = User.create!(:username => "panda", :password => "bamboo")
    end

    it "Should  return nil with wrong password" do
      expect(User.find_by_credentials("panda", "candycane")).to be_nil
    end

    it "Should  return nil with wrong username" do
      expect(User.find_by_credentials("santa", "bamboo")).to be_nil
    end

    it "Should return the user" do
      expect(User.find_by_credentials("panda", "bamboo")).to be_an_instance_of(User)
    end

  end
end
