module ApplicationHelper
  def my_name
    "Abdullah @lger"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: "form-group has-error"
    else
      content_tag :div, capture(&block), class: "form-group"
    end
  end

  def up_vote_link_classes(post)
    css = "glyphicon glyphicon-chevron-up "
    vote = current_user.voted(post)
    vote && vote.up_vote? ? css += "voted" : ""
    css
  end

  def down_vote_link_classes(post)
    css = "glyphicon glyphicon-chevron-down "
    vote = current_user.voted(post)
    vote && vote.down_vote? ? css += "voted" : ""
    css
  end

end
