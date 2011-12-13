class Word < ActiveRecord::Base
  has_many :meanings, dependent: :destroy
end
