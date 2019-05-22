# frozen_string_literal: true

describe Posts::UseCases::Show do
  describe "#call" do
    subject(:call_use_case) { described_class.call(id: mocked_id) }

    context "when post exists" do
      let(:mocked_id) { "mocked_id" }
      let(:mocked_post) { "mocked_post" }
      let(:mocked_representation) { "mocked_representation" }
      let(:repository) { Posts::Repository }
      let(:representers) { Posts::Representers }

      before do
        allow(repository).to receive(:post_with_comments_and_users).and_return(mocked_post)
        allow(representers).to receive(:with_comments_and_users).and_return(mocked_representation)
        call_use_case
      end

      it { expect(call_use_case).to eq(mocked_representation) }
      it { expect(repository).to have_received(:post_with_comments_and_users).with(id: mocked_id) }
      it { expect(representers).to have_received(:with_comments_and_users).with(mocked_post) }
    end
  end
end
