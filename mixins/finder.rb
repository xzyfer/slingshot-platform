module Finder
  def _find_all(query)
    mongo(self.name.downcase.to_sym).find(query)
  end

  def find(query)
    if !(result = _find_all(query)).empty?
      self.new(result.first)
    end
  end

  def self.find_all(query)
    if query
      _find_all(query).map{ |u| self.new(u) }
    end
  end

end
