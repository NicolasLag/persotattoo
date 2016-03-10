module ApplicationHelper

  def gravatar_for(user, size = 30, title = user.first_name)
    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
  end

  def active_class(link_path)
      current_page?(link_path) ? "active" : ""
  end
end
