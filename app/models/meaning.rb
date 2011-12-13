class Meaning < ActiveRecord::Base
  has_many :examples
  belongs_to :word
end
