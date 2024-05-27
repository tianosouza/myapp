# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article) }
  let(:long_text) { "a" * 256 }

  context "atributes" do
    it "returns valid with valid attributes" do
      expect(article).to be_valid
    end

    it "returns not valid without a title" do
      article.title = nil
      expect(article).not_to be_valid
    end

    it "returns not valid without a content" do
      article.content = nil
      expect(article).not_to be_valid
    end

    it "returns not valid with a title is short" do
      article_other = Article.new(title: "Hi", content: "My text example")
      expect(article_other).not_to be_valid
    end

    it "returns not valid with a title that is long" do
      article_other = Article.new(title: long_text, content: "My text example")
      expect(article_other).not_to be_valid
    end

    it "returns not valid with duplicate titles" do
      article_other = Article.new(title: article.title, content: "My text example")
      expect(article_other).not_to be_valid
    end
  end

  describe ".search" do
    let(:article1) { create(:article, title: "First Article", content: "This is the first article content.") }
    let(:article2) { create(:article, title: "Second Article", content: "Content of the second article.") }
    let(:article3) { create(:article, title: "Another Article", content: "This article has different content.") }
    
    context "when query matches the title" do
      it "returns the matching articles" do
        expect(Article.search("First")).to include(article1)
        expect(Article.search("First")).not_to include(article2, article3)
      end
    end

    context "when query matches the content" do
      it "returns the matching articles" do
        results = Article.search("Second Article")

        expect(results).to include(article2)
        expect(results).not_to include(article1, article3)
      end
    end

    context "when query matches both title and content" do
      it "returns the matching articles" do
        expect(Article.search("Article")).to include(article1, article2, article3)
      end
    end

    context "when query does not match any article" do
      it "returns an empty result" do
        expect(Article.search("Nonexistent")).to be_empty
      end
    end

    context "when query is empty" do
      it "returns all articles" do
        expect(Article.search("")).to include(article1, article2, article3)
      end
    end
  end

  describe "associations" do
    let!(:article) { create(:article) }
    let!(:comment1) { create(:comment, article: article, content: "First comment") }
    let!(:comment2) { create(:comment, article: article, content: "Second comment") }
    
    it "has many comments" do
      expect(article.comments).to include(comment1, comment2)
    end
  end
end