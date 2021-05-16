require_relative "../service/zendeskservice"
require "json"
require "open-uri"

describe ZendeskService do
    describe ".get_client" do
        it "returns http success" do
            client_hash = JSON.parse(URI)
            expect(ZendeskService.get_client).to be_a Hash
            expect(client_hash["id"].size).to eq(100)
        end
    end

    describe ".transform" do
        it "returns JSON body response contains expected ticket attributes" do
            expect(ZendeskService.transform).to eq([:id, :requester, :subject, :description, :created_at, :status])
        end
    end
end

