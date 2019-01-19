class Landmark < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable::Find

  belongs_to :figure
end
