require 'rails_helper'

describe Comment do
  context "when the product has reviews" do
  @user = FactoryBot.build(:user)
    it "is equal or less than 5" do
      @comment = FactoryBot.create(:comment)
      expect(@comment.rating).to be <= 5
    end

    it "is not valid without user, product, rating" do
      expect(Comment.new(body: "Nice notepad")).not_to be_valid
    end

    it "rating has to be an integer" do
      expect(Comment.new(user_id: 1, body:"cool", rating: "great")).not_to be_valid
    end
  end
end
