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
    vote = current_user.voted(post)
    if vote && vote.up_vote?
      "voted"
    end
  end

  def down_vote_link_classes(post)
    vote = current_user.voted(post)
    if vote && vote.down_vote?
      "voted"
    end
  end

end
