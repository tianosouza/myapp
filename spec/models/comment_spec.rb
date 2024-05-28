require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:article) { create(:article) }
  let(:comment) { build(:comment, article: article) }

  describe "associations" do
    it { is_expected.to belong_to(:article) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(comment).to be_valid
    end

    it "is not valid without content" do
      comment.content = nil
      expect(comment).not_to be_valid
    end

    it "is not valid with content less than 1 character" do
      comment.content = ""
      expect(comment).not_to be_valid
    end
  end
end
