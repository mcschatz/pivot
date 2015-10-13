class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, format: {
                      :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
                    }
end
