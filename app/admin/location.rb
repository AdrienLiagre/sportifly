ActiveAdmin.register Location do
  config.filters = false

  permit_params :name, :address, :city, :postcode,
    location_sports_attributes: [:sport_id]

  form do |f|
    f.inputs "Details" do
     f.input :name
     f.input :address
     f.input :city
     f.input :postcode
   end

   f.inputs do
     f.has_many :location_sports, allow_destroy: true, new_record: true do |sport_form|
       sport_form.input :sport
     end
   end

   f.actions
  end

  show do
    columns do
      attributes_table do
        row :id
        row :name
        row :address
        row :postcode
        row :city
        row :latitude
        row :longitue
        row :created_at
        row :updated_at
      end

      panel "Sports" do
        location.sports.each do |sport|
          attributes_table_for sport do
            row :name
          end
        end
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
