class User
  def self.find(id)
    if id && !(user = mongo(:user).find("name" => id)).empty?
      self.new(user.first)
    else
      # No such user
      nil
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
