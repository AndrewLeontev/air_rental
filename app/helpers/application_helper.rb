module ApplicationHelper
  def fa_icon(icon='fa fa-flag', text='', need_span=false)
    html = "<i class='#{icon}'></i> #{text}"
    html = "<span>#{html}</span>" if need_span
    html.html_safe
  end
end
