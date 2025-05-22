module ApplicationHelper
  def display_stars(rating)
    output = ""

    rating.to_i.times do
      output << content_tag(:i, "", class: "star-rating")
    end
  end
end
