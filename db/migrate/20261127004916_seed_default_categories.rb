class SeedDefaultCategories < ActiveRecord::Migration[8.1]
  def up
    %w[Equipment Furniture Book Other].each do |name|
      Category.find_or_create_by!(name: name)
    end
  end
  
  def down
    
  end
end
