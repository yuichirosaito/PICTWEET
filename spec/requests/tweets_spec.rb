require 'rails_helper'
describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get tweet_path(@tweet)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include @tweet.text
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include @tweet.image
    end
    it "indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する" do 
      get tweet_path(@tweet)
  expect(response.body).to include "＜コメント一覧＞"
    end
  end
end