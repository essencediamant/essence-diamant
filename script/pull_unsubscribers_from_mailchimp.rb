class PullUnsubscribersFromMailchimp < ActiveRecord::Base
	gb = Gibbon.new("9a74ef27a5472f7a63e06d6dbe7bba7a-us7")

	group = { :id => gb.list_interest_groupings(:api_key => "9a74ef27a5472f7a63e06d6dbe7bba7a-us7", :id => "450a3cc3cd")[0]["id"] }
	gb.list_subscribe({:id => "450a3cc3cd", :email_address => self.email, :update_existing => true, 
								     :double_optin => false, :send_welcome => false, 
								     :merge_vars => {'GROUPINGS' => {0 => {'id' => group[:id], 'groups' => self.language}}} })
	update_attribute(:active, true)
end	