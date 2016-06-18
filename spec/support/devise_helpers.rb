module DeviseHelpers
    def sign_in(options={})
        options[:email] ||= "example@example.com"
        options[:password] ||= "example123"
        User.create(email: options[:email], password: options[:password])

        visit new_user_session_path
        fill_in "Email", with: options[:email]
        fill_in "Password", with: options[:password]
        click_button "Entrar"
    end
end
