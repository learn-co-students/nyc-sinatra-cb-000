class Landmark < ActiveRecord::Base
  # add relationships here
  belongs_to :figure

  include HelperStuff

end
