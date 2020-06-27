module ApplicationHelper
  def fa_icon(icon='fa fa-flag', text='', need_span=false)
    html = "<i class='#{icon}'></i> #{text}"
    html = "<span>#{html}</span>" if need_span
    html.html_safe
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
  end
end
