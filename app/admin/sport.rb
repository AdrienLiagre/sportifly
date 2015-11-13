ActiveAdmin.register Sport do
  permit_params :name, :picture

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :picture, as: :file
    end
    f.actions
  end

  show do
    columns do
      attributes_table do
        row :id
        row :name
        row :created_at
        row :updated_at
        row :picture_file_name
        row :picture_content_type
        row :picture_file_size
        row :picture_updated_at
      end
    end
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
