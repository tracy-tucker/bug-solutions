class User < ActiveRecord::Base
    has_secure_password
    has_many :products
    has_many :bugs, :through => :products
end