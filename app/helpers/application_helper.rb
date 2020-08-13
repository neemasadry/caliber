module ApplicationHelper
  include Pagy::Frontend

  def avatar_url_for(user, opts = {})
    size = opts[:size] || 48

    # if user.respond_to?(:avatar) && user.avatar.attached? && user.avatar.variable?
    #   user.avatar.variant(combine_options: {
    #     thumbnail: "#{size}x#{size}^",
    #     gravity: "center",
    #     extent: "#{size}x#{size}"
    #   })
    if user.respond_to?(:avatar_image_data) && user.avatar_image_url.present?
      user.avatar_image_url(width: "#{size}", height: "#{size}", crop: :fit, gravity: "center")
    else
      hash = Digest::MD5.hexdigest(user.email.downcase)
      "https://secure.gravatar.com/avatar/#{hash}.png?height=#{size}&width=#{size}"
    end
  end

  def nav_link_to(title, path, options = {})
    options[:class] = Array.wrap(options[:class])
    active_class = options.delete(:active_class) || "active"
    inactive_class = options.delete(:inactive_class) || ""

    active = if (paths = Array.wrap(options[:starts_with])) && paths.present?
      paths.any? { |path| request.path.start_with?(path) }
    else
      request.path == path
    end

    classes = active ? active_class : inactive_class
    options[:class] << classes

    link_to title, path, options
  end

  def disable_with(text)
    "<i class=\"far fa-spinner-third fa-spin\"></i> #{text}".html_safe
  end

  def render_svg(name, options = {})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:class] = options.fetch(:styles, "fill-current text-gray-500")

    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end

  def fa_icon(name, options = {})
    weight = options[:weight] || "far"
    classes = [weight, "fa-#{name}", options[:class]]
    content_tag :i, nil, class: classes
  end

  def badge(text, options = {})
    base = options.delete(:base) || "rounded-full py-1 px-4 text-xs inline-block font-bold leading-normal uppercase mr-2"
    color = options.delete(:color) || "bg-gray-400 text-gray-700"

    options[:class] = Array.wrap(options[:class]) + [base, color]

    content_tag :div, text, options
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  ### App Specifi ###

  # To be used in _liking.html.erb and _favoriting.html.erb
  # localable refers to either 'likeable' or 'favoritable'
  def determine_nested_path(localable)
    if params[:controller] == "reviews"
      if @reviewable.present?
        return [@reviewable, localable]
      end
    else
      return localable
    end
  end

  def determine_gender_sign(model_instance)
    if model_instance.gender == "male" || model_instance.gender == "Male"
      fa_icon("fal fa-mars")
    elsif model_instance.gender == "female" || model_instance.gender == "Female"
      fa_icon("fal fa-venus")
    elsif model_instance.gender == "unisex" || model_instance.gender == "Unisex"
      fa_icon("fal fa-venus-mars")
    end
  end

  def brands_owned_by_user(user)
    @array_of_brands = []

    user.brands.each do |brand|
      option = [brand["name"], brand["id"]]
      @array_of_brands << option
    end

    return @array_of_brands
  end

  def display_price_range(range)
    if range == 1
      "Mass Market ($)"
    elsif range == 2
      "Reasonable ($$)"
    elsif range == 3
      "Premium ($$$)"
    elsif range == 4
      "Luxury ($$$$)"
    else
      "Reasonable ($$)"
    end # if..elsif..else
  end

  def user_profile_nav_tab_options(select_arr)
    #["products_&_brands", "guides", "profile", "notifications", "social", "settings", "subscription", "chat", "sponsor", "analytics"]
    if select_arr == "nav_only"
      #return ["products_&_brands", "guides", "profile", "notifications", "social", "settings"]
      return {
        "profile" => "fa-user-circle",
        "products_&_brands" => "fa-tshirt",
        "photos_&_videos" => "fa-camera-alt",
        "social" => "fa-chart-network",
        "settings" => "fa-cogs"
      }
    elsif select_arr == "render_page_names"
      return ["profile", "products_and_brands", "photos_and_videos", "social", "settings"]
    elsif select_arr == "render_page_names_for_select"
      return ["Profile", "Products & Guides", "Photos & Videos", "Social", "Settings"]
    end
  end

end
