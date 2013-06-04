class Subscriber < ActiveRecord::Base
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }

  def self.add_subscriber_to_mailchimp(id)
    find(id).add_subscriber_to_mailchimp
  end

	def add_subscriber_to_mailchimp
		gb = Gibbon.new("9a74ef27a5472f7a63e06d6dbe7bba7a-us7")

		gb.list_subscribe({:id => "450a3cc3cd", :email_address => :email, :update_existing => true, 
									     :double_optin => false, :send_welcome => false, 
									     :merge_vars => {'GROUPINGS' => {0 => {'id' => "Language", 'groups' => "French"}}} })
		update_attribute(active: true)
	end
end
