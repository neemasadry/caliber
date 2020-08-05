module Products
  extend ActiveSupport::Concern

  included do

    extend FriendlyId

    belongs_to :user
    belongs_to :brand

    has_many :product_images, as: :product_imageable, dependent: :destroy
    has_many :reviews, as: :reviewable, dependent: :destroy

    accepts_nested_attributes_for :product_images, allow_destroy: true

    friendly_id :name, use: :slugged

    acts_as_favoritable
    acts_as_votable

    searchkick word_start: [:name], word_middle: [:name], text_middle: [:type_of, :primary_color]
  end # included

  def search_data
    {
      name: name,
      type_of: type_of,
      primary_color: primary_color
    }
  end

  def has_gender?
    self.class.name == "Dress"
  end

  def has_material_or_colors?
    self.class.name != "Cosmetic" && self.class.name != "Fragrance"
  end

  def has_ingredients?
    self.class.name == "Cosmetic" && self.class.name == "Fragrance"
  end

  def has_type_of?
    self.class.name != "Fragrance"
  end

end
