ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :author, :user_rating, :genre_id, :review, :price, :year, :description, :image_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :author, :user_rating, :genre_id, :review, :price, :year, :description, :image_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
