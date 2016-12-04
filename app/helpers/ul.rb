module UL

    class PotluckAPI
      include HTTParty
      debug_output $stdout # <= will spit out all request details to the console
      base_uri 'https://ul-potluck.herokuapp.com'   
      
      def initialize user
          @user = user
      end   
      
      def add_user
        self.class.post("/users", 
        :body => {:user => @user}.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
      end
      
      # https://ul-potluck.herokuapp.com/items?api_key=279e1402cc10579d092874d7d9a0428f
      def get_items
        self.class.get("/items?api_key=#{@user[:api_key]}", 
        :headers => { 'Content-Type' => 'application/json' } )        
      end
      
      def add_item item
        @item = item
        self.class.post("/items", 
        :body => {:api_key => @user.api_key, :item => {:name => @item[:name]}}.to_json,
        :headers => { 'Content-Type' => 'application/json' } )      
      end


# [{"id":1,"name":"Roast Pig","user_id":1,"created_at":"2016-11-04T21:43:55.785Z","updated_at":"2016-11-04T21:43:55.785Z"},{"id":2,"name":"more napkins","user_id":1,"created_at":"2016-11-04T22:06:32.982Z","updated_at":"2016-11-04T22:06:32.982Z"},{"id":3,"name":"sorry guys..more green jello","user_id":3,"created_at":"2016-11-04T22:36:49.742Z","updated_at":"2016-11-04T22:36:49.742Z"},{"id":4,"name":"beer","user_id":2,"created_at":"2016-11-05T02:17:17.183Z","updated_at":"2016-11-05T02:17:17.183Z"},{"id":5,"name":"Apple Juice","user_id":4,"created_at":"2016-11-05T04:01:31.648Z","updated_at":"2016-11-05T04:01:31.648Z"},{"id":6,"name":"hot wings","user_id":4,"created_at":"2016-11-05T04:06:37.906Z","updated_at":"2016-11-05T04:06:37.906Z"},{"id":7,"name":"RED jello","user_id":5,"created_at":"2016-11-20T21:26:54.800Z","updated_at":"2016-11-20T21:26:54.800Z"},{"id":8,"name":"coffee","user_id":6,"created_at":"2016-11-22T03:23:23.241Z","updated_at":"2016-11-22T03:23:23.241Z"},{"id":9,"name":"refactor-test-alan","user_id":6,"created_at":"2016-11-22T03:36:47.454Z","updated_at":"2016-11-22T03:36:47.454Z"},{"id":10,"name":null,"user_id":23,"created_at":"2016-12-02T16:55:04.320Z","updated_at":"2016-12-02T16:55:04.320Z"},{"id":11,"name":"Christmas Sauerkraut","user_id":23,"created_at":"2016-12-02T17:21:22.306Z","updated_at":"2016-12-02T17:21:22.306Z"}]       

    end

    

end