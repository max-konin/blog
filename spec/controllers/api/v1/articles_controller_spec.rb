require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  before :each do
    request.accept = 'application/json'
  end

  describe 'GET index' do
    let!(:article){create :article}

    before(:each) {get :index}

    it {expect((assigns :articles).to_a).to eq [article]}
  end

  describe 'POST create' do
    subject{post :create, article: attributes}

    context 'valid attributes' do
      let(:attributes){ {title: 'text', text: 'title'} }

      it {expect{subject}.to change{Article.count}.by(1)}
      it 'status is ok' do
        subject
        expect(response.status).to eq 201
      end
    end

    context 'invalid attributes' do
      let(:attributes){ { text: 'title'} }

      it {expect{subject}.not_to change{Article.count}}
      it 'status is 422' do
        subject
        expect(response.status).to eq 422
      end
    end
  end
end
