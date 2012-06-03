if RUBY_VERSION =~ /1.8/
  class Array
    def sample
      self[rand(length)]
    end
  end
end

def user_view
  (params[:view] || :profile).to_sym
end

def user_view_is?(view)
  user_view == view
end

def link_to_user_view(view)
  "/user/#{params[:userid]}/#{view}"
end

class RandomData; class << self
  def address
    "#{street_number} #{street}, #{suburb}, #{postcode}"
  end

  def street_number
    rand(1000)
  end

  def street
    ["Candy Cane Lane",
     "Haha Road",
     "Grandview Ave",
     "Bayview Road"
    ].sample
  end

  def suburb
    ["Wonderland",
     "North Pole",
     "Disneyland"
    ].sample
  end

  def postcode
    rand(9999)
  end

  def phone_number
    [["1300", "1900", "1800"].sample,
     ["MEW", "MEOW"].sample,
     ["MEW", "MEOW"].sample
    ].join(" ")
  end

  def email_address
    "#{email_user}@#{email_domain}"
  end

  def website_url
    "www.#{email_user}.com"
  end

  def email_user
    ["softkitty",
     "warmkitty",
     "littleballoffur",
     "sleepykitty",
     "happykitty",
     "purrpurrpurr"
    ].sample
  end

  def email_domain
    ["gmail.com",
     "yahoo.com",
     "icanhazcheezburger.com"
    ].sample
  end

  def posts
    [
      {'title' => 'OMG I love cats!', 'body' => 'Suscipit jump biting tail flick tortor shed everywhere, feed me jump sleep on your face pharetra pharetra.'},
      {'title' => 'No I mean like I seriously love cats!', 'body' => 'Meow sleep in the sink chase the red dot I don\'t like that food, tortor kittens rhoncus sleep on your keyboard quis nunc stuck in a tree.'},
      {'title' => 'Arrggh! The cats, they\'re eating my face', 'body' => 'Puking adipiscing chase the red dot rip the couch, biting vulputate faucibus ac vel rutrum.'}
    ]
  end

end; end
