class User
  extend Finder

  def self.find(id)
    if !(user = _find_all(id)).empty?
      self.new(user.first)
    end
  end

  def self.find_all(id)
    if id
      _find_all(id).map{ |u| self.new(u) }
    end
  end

  def initialize(params)
    @params=params
  end

  # TODO write methods
  def method_missing(sym, *args)
    @params[sym.to_s]
  end

end
