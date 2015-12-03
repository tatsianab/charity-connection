Fabricator(:item, :class_name => "Item") do
  category_id 2
  business_id 2
  title "a cool item"
  inventory 14
  description " its so cool that is crazy"
  photo_url "k;lkdfjkld;"

end

Fabricator(:business, :class_name => "Business") do
  user_id 3
end
