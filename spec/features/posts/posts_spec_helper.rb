def user_attempts_post
  visit posts_index_path
  click_button "Generate Log"
end

def user_submits_post(content)
  fill_in "Log entry", with: content
  click_button "Enter Log"
end
