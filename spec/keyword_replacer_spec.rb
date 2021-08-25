# frozen_string_literal: true

RSpec.describe KeywordReplacer do
  it 'has a version number' do
    expect(KeywordReplacer::VERSION).not_to be nil
  end

  context 'valid data' do
    context 'Post that does not contain any keywords' do
      let(:post) { Post.create(text: 'Hello') }

      it 'does not change the text' do
        expect(post.transformed_text).to eq post.text
      end
    end

    context 'Post that have keywords' do
      let(:post) do
        Post.create(text: "Lorem Ipsum is test dummy text of test the printing test and word typesetting word
                           industry. word Lorem Ipsum has been the industry's standard dumm foo")
      end

      it 'replaces words `test` and `word` for 4 times(2 for each)' do
        result = "Lorem Ipsum is <a target='_blank' class='custom' href='http://test.com' >test</a> dummy text of
                  <a target='_blank' class='custom' href='http://test.com' >test</a> the printing test and
                  <a target='_blank' class='custom' href='http://word.com' >word</a> typesetting
                  <a target='_blank' class='custom' href='http://word.com' >word</a>
                  industry. word Lorem Ipsum has been the industry's standard dumm foo".delete("\n").squeeze

        expect(post.transformed_text.delete("\n").delete("\r").squeeze).to eq result
      end
    end
  end

  context 'invalid data' do
    let(:post) { Post.create(text: 'Hello', bool: true) }

    it 'raises KeywordReplacer::TypeError error if it is called on non text fields' do
      expect { post.transformed_bool }.to raise_error KeywordReplacer::TypeError
    end
  end
end
