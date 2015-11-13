ActiveAdmin.register User do
  permit_params :email, :picture, :password, :password_confirmation, :name, :age, :crew, :phone_number

  form do |f|
    f.inputs "Details" do
      f.semantic_errors # shows errors on :base
      f.input :email
      f.input :picture
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :name
      f.input :age
      f.input :crew
      f.input :phone_number
    end

    f.actions
  end
end
