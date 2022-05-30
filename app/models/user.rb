class User < ApplicationRecord
  encrypts :first_name, :last_name, :email, :birthday
end
