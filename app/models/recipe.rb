class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  validates :title, presence: true

  Paperclip.interpolates :file_name do |attachment, style|
    "image_" + attachment.instance.id.to_s
  end

  has_attached_file :image, styles: { small: '640x320#' }, path: ":style/:file_name", :default_url => ":style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def response
    { id: self.id,
      title: self.title,
      image_url: self.image.url(:small),
      ingredients: self.ingredients,
      steps: self.steps }
  end

  def self.response(instances)
    instances.map { |instance| instance.response }
  end
end