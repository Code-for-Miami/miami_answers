require 'spec_helper'

describe SearchController do
  describe "#reindex_articles" do
    it "reindexes articles via tanker" do
      Article.should_receive(:tanker_reindex)
      get :reindex_articles
    end
  end
end
