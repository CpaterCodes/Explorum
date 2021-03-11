def user_comments_on_post(post, message)
  visit new_post_comment_path(post)
  fill_in "comment_message", with: message
  click_on "Enter Comment"
end
