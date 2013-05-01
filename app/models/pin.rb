class Pin < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :description, :image

  # Validations
  validates :description, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
							   content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
							   size: { less_than: 5.megabytes} 

  # Relationships
  belongs_to :user
  has_attached_file :image, styles: {medium: "320x240>"}

end