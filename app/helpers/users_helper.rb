module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def path_follower(id)
    link_to "Followers List",
    { controller: :users, action: :follower, id: id},
    { :id => "link_id", :class => "link_class"}
  end

  def path_followed(id)
    link_to "Followeds List",
    { controller: :users, action: :followed, id: id},
    { id: "link_id", class: "link_class"}
  end
end