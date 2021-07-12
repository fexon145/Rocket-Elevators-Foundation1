
RailsAdmin.config do |config|
 require Rails.root.join('lib', 'google.rb')
 require Rails.root.join('lib', 'watson.rb')
 config.authorize_with do |controller|
    unless current_user&.is_employee?(current_user) ==  true
      redirect_to main_app.root_path
      flash[:error] = "You are not an admin"
    end
  end

config.actions do
  dashboard       # mandatory                   
  index
  # root          # mandatory             
  new
  export
  bulk_delete
  show
  edit
  delete
  show_in_app
  google
  watson
  ## With an audit adapter, you can add:
  # history_index
  # history_show
  end
end
# RailsAdmin.config do |config|
#     config.authenticate_with do
#       warden.authenticate! scope: :user
#     end
#     config.current_user_method(&:current_user)
#   end

