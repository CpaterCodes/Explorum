def full_sign_up (username, email, password)
  visit new_user_registration_path
  fill_in 'user_username', with: username
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button 'Sign up'
end

def sign_off
  click_link('Sign off')
end
