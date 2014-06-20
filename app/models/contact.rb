class Contact < ActiveRecord::Base
#validating form fields for the presence, uniqueness and length
validates :FirstName, presence: true, length: {minimum: 2, maximum: 25 }
validates :LastName, presence: true, length: {minimum: 2, maximum: 25 }
validates :EmailId, presence: true, uniqueness: true
validates :MobileNumber, presence: true, uniqueness: true, length: {minimum: 10, maximum: 10 }
validates :Address, presence: true, length: {minimum: 2, maximum: 25 }

end
