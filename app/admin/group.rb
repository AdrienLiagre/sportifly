ActiveAdmin.register Group do
  permit_params :name, :description, :email_domain_name, :slug, :picture
  controller do
   def find_resource
     scoped_collection.friendly.find(params[:id])
   end
  end
  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :email_domain_name
      f.input :slug
      f.input :picture, as: :file
    end

    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

end
