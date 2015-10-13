class Content < ActiveRecord::Base
  self.table_name = "content" # b/c table name is not "contents"
  validates :name, presence: true, uniqueness: true
end