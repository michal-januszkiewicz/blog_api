# frozen_string_literal: true

describe Api::V1::PostsController, type: :request do
  describe "#show" do
    subject(:call_api) { get "/api/v1/posts/#{post_id}" }

    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    context "when post exists" do
      let(:post) { create(:post, user: user1) }
      let(:comment1) { create(:comment, user: user2, post: post) }
      let(:comment2) { create(:comment, user: user1, comment: comment1) }
      let(:post_id) { post.id }

      before do
        post
        comment1
        comment2
        call_api
      end

      it { expect(response.status).to eq(200) }
      it { expect(json_body["id"]).to eq(post_id) }

      # TODO: add more advanced schema.
      it { expect(json_body).to match_schema("post_with_comments_and_users") }
    end

    context "when post doesn't exists" do
      let(:post_id) { -1 }

      before { call_api }

      it { expect(response.status).to eq(404) }
    end
  end
end
