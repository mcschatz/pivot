class Give < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :price, presence: :true
  validates :title, uniqueness: true

  has_attached_file :picture,
                    styles: {large: "500x300>",
                             medium: "700x700>",
                             thumb: "100x100>" },
                    bucket: 'give-n-get'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
