class Item < ActiveRecord::Base
  validates :title, :description, :price, presence: :true
  validates :title, uniqueness: true
  validates :categories, presence: :true
  has_and_belongs_to_many :categories
  has_many :order_items
  before_save :set_slug

  has_attached_file :picture,
                    styles: {large: "500x300>",
                             medium: "700x700>",
                             thumb: "100x100>" },
                    bucket: 'give-n-get'
  has_attached_file :picture, styles: {large: "500x300>", medium: "700x700>", thumb: "100x100>" },default_url: "http://s3.amazonaws.com/give-n-get/items/pictures/000/000/017/medium/0.png?1443661648", bucket: 'give-n-get'
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  scope :hidden, -> { where(visible: false) }
  scope :visible, -> { where(visible: true) }

  private

  def set_slug
    self.slug = title.parameterize
  end

end
