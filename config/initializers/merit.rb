# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'

  Merit::Badge.create!(
    id: 1,
    name: "Arsene Wenger",
    description: "Over 5 feeds",
    custom_fields: { img_url: 'badges/suiveur.png' }
  )
  Merit::Badge.create!(
    id: 2,
    name: "Pierre Menes",
    description: "Over 10 feeds",
    custom_fields: { img_url: 'badges/participant.png' }
  )

  Merit::Badge.create!(
    id: 3,
    name: "Sportif de canapé",
    description: "sans fly",
    custom_fields: { img_url: 'badges/pecheur.png' }
  )

  Merit::Badge.create!(
    id: 4,
    name: "Sportif du dimanche",
    description: "Over 1 fly",
    custom_fields: { img_url: 'badges/planche.png' }
  )

  Merit::Badge.create!(
    id: 5,
    name: "Sportif amateur",
    description: "Over 5 fly",
    custom_fields: { img_url: 'badges/kawak.png' }
  )

  Merit::Badge.create!(
    id: 6,
    name: "Sportif professionnel",
    description: "Over 10 fly",
    custom_fields: { img_url: 'badges/canoe.png' }
  )

  Merit::Badge.create!(
    id: 7,
    name: "Chris Froome",
    description: "Over 25 fly",
    custom_fields: { img_url: 'badges/froome.png' }
  )
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
