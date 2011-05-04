def load_test_user
  
  User.create! :login => "zubair",
    :user_name => "Test User",
    :email => "jmahamad@idexcel.com",
    :password => "zubair",
    :password_confirmation => "zubair"
  
end