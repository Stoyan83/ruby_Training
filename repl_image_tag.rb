def image_tag(image_path, options = {})
  str = "<img src= '#{image_path}'"

  options.map { |attr, value| str << " #{attr}='#{value}'"}

  str << '>'
end


puts image_tag("https://path/pic.jpg", width: 42)