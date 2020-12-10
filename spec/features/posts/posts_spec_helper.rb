def user_attempts_post
  visit posts_path
  click_on "Generate Log"
end

def user_submits_post(content)
  fill_in "content", with: content
  click_on "Enter Log"
end
