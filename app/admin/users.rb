ActiveAdmin.register User do

  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at


    index do
    selectable_column
    column :id
    column :email
    column :encrypted_password
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    column :created_at
    column :updated_at
    actions
  end

end
