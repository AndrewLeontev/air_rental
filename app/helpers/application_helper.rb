module ApplicationHelper
  def fa_icon(icon='fa fa-flag', text='', opts={})
    html = "<i class='#{icon}'></i>#{text}"
    html = "<span>#{html}</span>" if opts[:need_span]
    html.html_safe
  end

  def data_spinner
    "<i class='fa fa-spinner fa-spin'></i>"
    '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>'
  end

  def avatar_url(user)
    return "http://graph.facebook.com/#{user.uid}/picture?type=large" if user.image

    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
  end
end
