class UserImage < ApplicationRecord

  belongs_to :User, optional: true

end
