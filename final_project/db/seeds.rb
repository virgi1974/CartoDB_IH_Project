# (1..10).each do |index|
#   m = Map.create(table: "map #{index}",
#     user_id: "#{index +1}",
#     description: "description #{index}",
#     city: "city #{index}",
#     state: "state #{index}",
#     date1: Date.new,
#     date2: Date.new,
#     shared: true)
# end

# User.first.maps.first.comments.first.content !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


      u1 = User.new( 
        name: "virgi2",
        email: "virgifp2@yahoo.es",
        password: "ariadna20102", 
        password_confirmation: "ariadna20102") 
      u1.save 

      u1.comments.create(content: "fabuloso")
      u1.comments.create(content: "great")
      u1.comments.create(content: "shit")
      u1.comments.create(content: "wothless")
      u1.comments.create(content: "so so")
      u1.comments.create(content: "amazing    !!!!!")
      u1.comments.create(content: "cool")
      u1.comments.create(content: "stupid")
      u1.comments.create(content: "bad")
      u1.comments.create(content: "good")




      # 10.times do # - create 10 user posts for every user (this is called within the user creation block!!!!!!)
      #   maps = topics.first # - set the local to first topic

        p = u1.maps.create( # - create a post within the scope of a unique user instance
          table: "ufo",
          city: "", 
          state: "OR",
          date1: "10-05-1974", 
          date2: "11-05-1999",
          shared: true, 
          description: "map of  california",
          user_id: 1)
        p.save

        p2 = u1.maps.create( # - create a post within the scope of a unique user instance
          table: "ufo",
          city: "", 
          state: "CA",
          date1: "10-05-1974", 
          date2: "11-05-1999",
          shared: true, 
          description: "map of  california",
          user_id: 34)
        p.save


        p2.comments << u1.comments.first

    #   end
    # end

