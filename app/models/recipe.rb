class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  validates :title, presence: true
  validates :healthiness, presence: true
  validates :preparation, presence: true
  validates :price, presence: true

  Paperclip.interpolates :file_name do |attachment, style|
    if attachment.instance.class.to_s == "Recipe"
      "image_" + attachment.instance.id.to_s
    else 
      "profile_" + attachment.instance.id.to_s
    end
  end

  has_attached_file :image, path: ":style/:file_name", :default_url => ":style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end