ActiveAdmin.register Account do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :confirmed, :account_balance, :state, :account_number,  :phone_number,   :dob, :routine_number, :user_id,  :slug, :account_type, :account_pin, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form do |f|

   f.inputs do
f.input :user_id, :label => 'Users', :as => :select, :collection => User.all.map{|u| ["#{u.email}, #{u.first_name}", u.id]}
     f.input :account_balance
     f.input :confirmed
   end
     f.submit :submit
   end
   controller do
          def find_resource
            scoped_collection.friendly.find(params[:id])
          end
        end

end
