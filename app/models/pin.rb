class Pin < ActiveRecord::Base
  attr_accessible :description, :image


  validates :description, presence: true
  validates :user_id, presence: true
  has_attached_file :image, styles: { medium: "320x240>"},
  	:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
  validates_attachment :image, presence: true,
  														 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  														 size: { less_than: 5.megabytes }


  belongs_to :user

end
