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
			@subscriber.delay(queue: "add_subscribers", priority: 10).add_subscriber_to_mailchimp
			if params[:subscriber][:language] == "French"
				render 'french_subscribe_success'
		  elsif params[:subscriber][:language] == "English"
		 		render 'english_subscribe_success'
		  end
		else
			if params[:subscriber][:language] == "French"
				render 'french_subscribe_failure'
		  elsif params[:subscriber][:language] == "English"
		 		render 'english_subscribe_failure'
		  end
		end
	end

	def mailchimp_event
		if params[:type] == "unsubscribe"
		  @subscriber = Subscriber.find_by(email: params[:data][:email])
		  @subscriber.destroy
		end
	end
end
