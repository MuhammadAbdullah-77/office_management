namespace :permissions do
    puts "Roles Created and Permissions Guaranted"
  
    task:role => [ :environment ] do
        Role::NAME.each do |name|
            Role.where(name: name).first_or_create
        end
      
        Permission::ACTIONS_MAP.each_pair do |key,value| value.each do |u|
            Role.all.each do |role|
                if role.name == "Admin"
                  role.permissions.where(name: "#{key}:#{u}", value: true).first_or_create
                else
                  role.permissions.where(name: "#{key}:#{u}").first_or_create
                end
            end
            end
        end
    end
  end