class FigureTitle < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable::Find

  belongs_to :title
  belongs_to :figure
end
