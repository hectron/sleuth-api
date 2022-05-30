class User < ApplicationRecord
  encrypts :first_name, :last_name, :email, :date_of_birth
end
