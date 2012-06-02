class User < Base

  def networks
    Network.find_all("parent_id" => self._id)
  end

end
