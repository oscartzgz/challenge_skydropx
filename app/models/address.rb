class Address < ApplicationRecord
  validate_presence_of  :name,
                        :email,
                        :street1,
                        :city,
                        :province,
                        :postal_code,
                        :country_code

  validate :name, length: { maximum: 64 }
  validate :street1, length: { maximum: 64 }, format: { with: /^[\%\$\&\@\+\|]/, message: 'The "%, $, &, @, +, |" symbols are not allowed' }
  validate :city, length: { maximum: 64 }
  validate :province, length: { maximum: 64 }
  validate :email, format: { with: /[a-zA-z]*@*\.[a-zA-z]*/, message: 'Bad format' }
  validate :postal_code, format: { with: /\A\d{5}\z/, message: 'Only five numbers are allowed' }
  validate :country_code, length: { maximum: 2 }
end
