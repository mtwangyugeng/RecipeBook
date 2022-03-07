module ControllerTestHelper
    def login
        post "/api/login", 
            params: { email: "alice@test.com", password: "test" }
        return JSON.parse(response.body)["token"]
    end
end