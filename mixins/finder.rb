module Finder
  def _find_all(query)
    mongo(self.name.downcase.to_sym).find(query)
  end
end
