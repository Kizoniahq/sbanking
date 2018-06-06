ActiveAdmin.register Deposit do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :payment_method, :amount, :status, :depositors_name, :date, :account_id, :user_id
#
form do |f|

   f.inputs do
f.input :user_id, :label => 'Users/Client', :as => :select, :collection => User.all.map{|u| ["#{u.email}, #{u.first_name}", u.id]}
f.input :account_id, :label => " Clients Account", :as => :select, :collection => Account.all.map{|a| ["#{a.account_number}", a.id]}
     f.input :amount
     f.input :payment_method, as: :select, :collection => ["Wire Transfer", "Cash Deposit"]
     f.input :depositors_name, label: " Sender's Name"
     f.input :status
     f.input :date
   end
     f.submit :submit
   end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
