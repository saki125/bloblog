require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '投稿作成' do
    context '内容に問題ない場合' do
      it 'すべての情報がある場合' do
        expect(@post).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'titleが空の時' do
        @post.title =''
        @post.valid?
        expect(@post.errors.full_messages).to include("Titleを入力してください")
      end
      it 'textが空の時' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Textを入力してください")
      end
      it 'imageが空の時' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Imageを入力してください")
      end
    end
  end
end
