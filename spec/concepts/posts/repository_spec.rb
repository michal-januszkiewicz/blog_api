# frozen_string_literal: true

describe Posts::Repository do
  describe "#post_with_comments_and_users" do
    subject(:get_data) { described_class.post_with_comments_and_users(id: post_id) }

    context "when post exists" do
      let(:post) { create(:post) }
      let(:comment) { create(:comment, post: post) }
      let(:post_id) { post.id }

      before do
        post
        comment
      end

      it { expect(get_data).to eq(post) }
      it { expect(get_data.comments).to include(comment) }
    end

    context "when post doesn't exist" do
      let(:post_id) { -1 }

      it { expect { get_data }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
