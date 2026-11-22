
["Equipment", "Furniture", "Book", "Other"].each do | category |
  Category.find_or_create_by!(name: category)
end