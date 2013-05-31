require 'spec_helper'

describe Subscriber do
  before { @subscriber = Subscriber.new(fname: "Example", lname: "User", email: "user@example.com") }

  subject { @subscriber }

  it { should respond_to(:fname) }
  it { should respond_to(:lname) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when email is not present" do
  	before { @subscriber.email = " " }
  	it { should_not be_valid }
  end

  describe "when first name is too long" do
  	before { @subscriber.fname = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when last name is too long" do
  	before { @subscriber.lname = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
  		addresses.each do |invalid_address|
  			@subscriber.email = invalid_address
  			expect(@subscriber).not_to be_valid
  		end
  	end
  end

  describe "when email format is valid" do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  		addresses.each do |valid_address|
  			@subscriber.email = valid_address
  			expect(@subscriber).to be_valid
  		end
  	end
  end

  describe "when email address is already taken" do
  	before do
  		subscriber_with_same_email = @subscriber.dup
  		subscriber_with_same_email.email = @subscriber.email.upcase
  		subscriber_with_same_email.save
  	end

  	it { should_not be_valid }
  end
end
