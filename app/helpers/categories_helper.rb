# Not associated with any model in app/models
module CategoriesHelper

  def product_categories_for_men
    #'grooming': ['shaving', 'hair', 'skin'], 'body care': ['shampoos', 'body washes', 'deoderants'],
    {
      'tops': ['shirts', 't-shirts', 'hoodies', 'sweaters', 'sleep'],
      'bottoms': ['pants', 'jeans', 'shorts'],
      'accessories': ['eyewear', 'neckwear', 'hats', 'hands', 'belts', 'ties', 'wallets', 'watches', 'handbags'].sort_by(&:downcase),
      'shoes': ['athletic', 'designer', 'loafers', 'oxfords', 'boots', 'sandals', 'clogs'],
      'fragrances': nil,
      'jewelries': ['necklaces', 'rings', 'earrings', 'bracelets', 'other'],
      'suits': ['formal', 'business casual']
    }.sort
  end

  def product_categories_for_women
    {
      'tops': ['tunics', 'camis', 'blouses', 't-shirts', 'polos', 'bodysuits', 'shirts'],
      'bottoms': ['jeans', 'pants', 'skirts', 'shorts', 'leggings'],
      'accessories': ['eyewear', 'neckwear', 'hats', 'handwear', 'belts', 'wallets', 'watches', 'handbags'].sort_by(&:downcase),
      'dresses': ['casual', 'formal', 'night out', 'cocktail', 'work', 'wedding'],
      'shoes': ['athletic', 'designer', 'boots', 'flats', 'pumps', 'slippers', 'clogs', 'sandals', 'loafers', 'oxfords'],
      'fragrances': nil,
      'jewelries': ['necklaces', 'earrings', 'rings', 'bracelts', 'other'],
      'cosmetics': ['skin', 'hair', 'makeup']
    }.sort
  end

  def product_categories_for_home
    {
      'decor': nil,
      'kitchen': nil,
      'bedroom': nil,
      'bathroom': nil,
      'storage': nil,
      'pets': nil,
      'outdoor': nil,
      'appliances': nil
    }.sort
  end

  def product_categories_for_electronics
    {
      'tvs': nil,
      'computers': nil,
      'smartphones': nil,
      'tablets': nil,
      'wearables': nil,
      'hobbies': nil,
      'car': nil,
      'musical': nil,
      'audio': nil,
      'video games': nil
    }.sort
  end

  # Subcategories for select field
  def tops_select
    [['Shirt', 'shirt'], ['T-shirt', 't-shirt'], ['Hoody', 'hoody'], ['Sweater', 'sweater'], ['Pajama', 'pajama']]
  end

  def guides_categories_for_men
    {
      'fashion': nil,
      'style': nil,
      'grooming': nil,
      'fragrances': nil,
      'lifestyle': nil,
      'gear': nil,
      'hobbies': nil,
      'skills': nil,
    }.sort
  end

  def guides_categories_for_women
    {
      'fashion': nil,
      'style': nil,
      'beauty': nil,
      'fragrances': nil,
      'lifestyle': nil,
      'gear': nil,
      'hobbies': nil,
      'skills': nil,
    }.sort
  end

  def guides_categories_for_relationships
    {
      'dating': nil,
      'family': nil,
      'friends': nil,
      'professional': nil
    }.sort
  end

  def guides_categories_for_home_care
    {
      'home decor': nil,
      'cleaning': nil,
      'organization': nil,
      'outdoors': nil,
      'entertainment': nil,
      'hospitality': nil
    }.sort
  end

  def guides_categories_for_health
    {
      'diet': ['nutrition', 'supplements'],
      'wellness': ['confidence & motivation', 'stress management', 'spiritual'],
      'fitness & exercise': nil,
      'workouts': nil
    }.sort
  end

  # Social

  def social_categories_for_influencers
    {
      'all': nil,
      'men': nil,
      'women': nil
    }.sort
  end

  def social_categories_for_qanda
    qanda_categories = ['general', 'health', 'travel', 'career', 'dating', 'sex', 'grooming', 'style', 'fitness', 'food & drinks', 'movies & tv', 'music'].sort
    {
      'men': qanda_categories,
      'women': qanda_categories
    }.sort
  end

end
