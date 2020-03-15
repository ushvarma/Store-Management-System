json.extract! wishlist, :id, :wname, :wishlistItem, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
