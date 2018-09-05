class Helpers

  def self.add_titles(figure, selected_titles, new_title_name)

    if selected_titles
      selected_titles.each do |title_id|
        figure.titles << Title.find_by(id: title_id)
      end
    end

    if !(new_title_name.empty?)
      new_title = Title.create(name: new_title_name)
      figure.titles << new_title
    end
    figure.save
  end

  def self.add_landmarks(figure, selected_landmarks, new_landmark_data)

    if selected_landmarks
      selected_landmarks.each do |landmark_id|
        figure.landmarks << Landmark.find_by(id: landmark_id)
      end
    end

    if !(new_landmark_data[:name].empty?)
      new_landmark = Landmark.create(name: new_landmark_data[:name])
      if !(new_landmark_data[:year].empty?)
        new_landmark.year_completed = new_landmark_data[:year]
        new_landmark.save
      end
    figure.landmarks << new_landmark
    end
    figure.save
  end

end
