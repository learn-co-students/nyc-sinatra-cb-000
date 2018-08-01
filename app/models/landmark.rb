class Landmark <ActiveRecord::Base
  belongs_to :figure
end

class Figure <ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, :through => :figure_titles
end

class Title <ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, :through => :figure_titles
end

class FigureTitle <ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
end
