class Post < Base

  def posts
    Post.find_all("parent_id" => self._id)
  end

end
