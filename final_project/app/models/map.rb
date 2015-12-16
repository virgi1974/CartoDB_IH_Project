class Map < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :description, presence: true
  validates :table, presence: true

  def to_custom_hash
    {email: self.user.email, name: self.user.name,description: self.description}
  end
end
