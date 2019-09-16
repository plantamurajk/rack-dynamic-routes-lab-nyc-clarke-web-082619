class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            search_term = req.path.split('/items/').last
            if @@items.find{|i| i.name == search_term}
                resp.write @@items.find{|i| i.name == search_term}.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
        resp.write "Route not found"
        resp.status = 404
        end

        resp.finish
   
    end
end