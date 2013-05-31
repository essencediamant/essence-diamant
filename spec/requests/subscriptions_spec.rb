require 'spec_helper'

describe "Subscriptions" do



	subject { page }

	describe "subscribe" do

		before { visit root_path }

		let(:subscribe) { "Subscribe" }

		describe "with invalid information" do
			it "should not create a subscriber" do
				expect { click_button subscribe }.not_to change(Subscriber, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Email", with: "user@example.com"
			end

			it "should create a subscriber" do
				expect { click_button submit }.to change(Subscriber, :count).by(1)
			end
		end
	end
end
