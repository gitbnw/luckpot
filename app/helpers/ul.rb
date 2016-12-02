module UL

    class PotluckAPI
      include HTTParty
      debug_output $stdout # <= will spit out all request details to the console
      base_uri 'https://ul-potluck.herokuapp.com'   
      
      def initialize user
          @user = user
      end   
      
      def response
        self.class.post("/users", 
        :body => {:user => @user}.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
      end

    end

end