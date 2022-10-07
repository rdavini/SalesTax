require 'rails_helper'

describe "Items API", type: :request do
    # it 'return all items' do
    #     get '/api/v1/items'
                    
    #     expect(response).to have_http_status(:success)
    # end
    it 'create item - Input 1' do
        post '/api/v1/items', :params => {:_json => JSON.parse([{"desc": "book","price": 12.49,"qty": 1}, 
                                                                {"desc": "music CD", "price": 14.99, qty: 1},
                                                                {"desc": "chocolate bar", "price": 0.85, qty: 1}].to_json)}
        expect(response.body).to eq("Items created succefully!")
        expect(response).to have_http_status(:success)

        get '/api/v1/items'
        expect(response).to have_http_status(:success)
        
        parsed_resp = JSON.parse(response.body)[0]["items"]
        
        #3 items should have been created
        expect(parsed_resp.count).to eq(3)
        
        #check 1st item values
        expect(parsed_resp[0]["desc"]).to eq("book")
        expect(parsed_resp[0]["qty"]).to eq(1)
        expect(parsed_resp[0]["price"]).to eq(13.74)
        
        #check 2nd item values
        expect(parsed_resp[1]["desc"]).to eq("music CD")
        expect(parsed_resp[1]["qty"]).to eq(1)
        expect(parsed_resp[1]["price"]).to eq(16.49)
        
        #check 3rd item values
        expect(parsed_resp[2]["desc"]).to eq("chocolate bar")
        expect(parsed_resp[2]["qty"]).to eq(1)
        expect(parsed_resp[2]["price"]).to eq(0.94)
    end

    # it 'create item - Input 2' do
    #     post '/api/v1/items', :params => {:_json => JSON.parse([{"desc": "imported box of chocolates", "price": 10.00,"qty": 1}, 
    #                                                             {"desc": "imported bottle of perfume", "price": 14.99, qty: 1}].to_json)}
    #     expect(response.body).to eq("Items created succefully!")
    #     expect(response).to have_http_status(:success)

    #     get '/api/v1/items'
    #     expect(response).to have_http_status(:success)
        
    #     parsed_resp = JSON.parse(response.body)[0]["items"]
        
    #     #3 items should have been created
    #     expect(parsed_resp.count).to eq(2)
        
    #     #check 1st item values
    #     expect(parsed_resp[0]["desc"]).to eq("imported box of chocolates")
    #     expect(parsed_resp[0]["qty"]).to eq(1)
    #     expect(parsed_resp[0]["price"]).to eq(14.35)
        
    #     #check 2nd item values
    #     expect(parsed_resp[1]["desc"]).to eq("imported bottle of perfume")
    #     expect(parsed_resp[1]["qty"]).to eq(1)
    #     expect(parsed_resp[1]["price"]).to eq(17.25)
    # end

    # it 'create item - Input 3' do
    #     post '/api/v1/items', :params => {:_json => JSON.parse([{"desc": "imported bottle of perfume","price": 27.99,"qty": 1}, 
    #                                                             {"desc": "bottle of perfume", "price": 18.99, qty: 1},
    #                                                             {"desc": "packet of headache pills", "price": 9.75, qty: 1},
    #                                                             {"desc": "box of imported chocolates", "price": 11.25, qty: 1}
    #                                                         ].to_json)}
    #     expect(response.body).to eq("Items created succefully!")
    #     expect(response).to have_http_status(:success)

    #     get '/api/v1/items'
    #     expect(response).to have_http_status(:success)
        
    #     parsed_resp = JSON.parse(response.body)[0]["items"]
        
    #     #3 items should have been created
    #     expect(parsed_resp.count).to eq(4)
        
    #     #check 1st item values
    #     expect(parsed_resp[0]["desc"]).to eq("imported bottle of perfume")
    #     expect(parsed_resp[0]["qty"]).to eq(1)
    #     expect(parsed_resp[0]["price"]).to eq(14.35)
        
    #     #check 2nd item values
    #     expect(parsed_resp[1]["desc"]).to eq("bottle of perfume")
    #     expect(parsed_resp[1]["qty"]).to eq(1)
    #     expect(parsed_resp[1]["price"]).to eq(17.25)
        
    #     #check 3rd item values
    #     expect(parsed_resp[2]["desc"]).to eq("packet of headache pills")
    #     expect(parsed_resp[2]["qty"]).to eq(1)
    #     expect(parsed_resp[2]["price"]).to eq(1)
        
    #     #check 4th item values
    #     expect(parsed_resp[3]["desc"]).to eq("box of imported chocolates")
    #     expect(parsed_resp[3]["qty"]).to eq(1)
    #     expect(parsed_resp[3]["price"]).to eq(1)
    # end
end