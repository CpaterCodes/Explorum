def user_attempts_post
  visit posts_path
  click_on "Generate Log"
end

def user_submits_post(content)
  user_attempts_post
  fill_in "post_content", with: content
  click_on "Enter Log"
end
