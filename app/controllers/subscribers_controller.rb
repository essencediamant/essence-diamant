class SubscribersController < ApplicationController

	def english_subscribe_success
	end

	def french_subscribe_success
	end

	def english_subscribe_failure
	end

	def french_subscribe_failure
	end

	def create
		@subscriber = Subscriber.new(email: params[:subscriber][:email], language: params[:subscriber][:language], active: false)
		if @subscriber.save
			Subscriber.delay(queue: "add_subscribers", priority: 10).add_subscriber_to_mailchimp(params[:subscriber][:id])
			if params[:subscriber][:language] == "french"
				render 'french_subscribe_success'
		  elsif params[:subscriber][:language] == "english"
		 		render 'english_subscribe_success'
		  end
		else
			if params[:subscriber][:language] == "french"
				render 'french_subscribe_failure'
		  elsif params[:subscriber][:language] == "english"
		 		render 'english_subscribe_failure'
		  end
		end
	end
end
