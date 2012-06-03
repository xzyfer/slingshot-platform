def user_view
  (params[:view] || :profile).to_sym
end

def user_view_is?(view)
  user_view == view
end

def link_to_user_view(view)
  "/user/#{params[:userid]}/#{view}"
end
