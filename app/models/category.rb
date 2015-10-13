class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_and_belongs_to_many :items
  before_save :set_slug

  private

  def set_slug
    self.slug = title.parameterize
  end
end
