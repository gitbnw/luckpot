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

    end

    

end