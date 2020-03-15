class Item < ApplicationRecord
    validates_presence_of :name
    has_many :comments, dependent: :destroy
    validates_presence_of :name
    validates_presence_of :category
    validates_presence_of :brand
    validates_presence_of :price
    has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

end
