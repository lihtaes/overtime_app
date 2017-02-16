require 'rails_helper'
describe 'approval workflow' do
  describe 'navigate' do
    before do
      @admin_user = FactoryGirl.create(:admin_user)
      login_as(@admin_user, :scope => :user)
    end

    describe 'edit' do
      before do
        @post = FactoryGirl.create(:post)
        visit edit_post_path(@post)
      end

      it 'has a status that can be edited on the form by an admin' do
        choose('post_status_approved')
        click_on "Save"

        expect(@post.reload.status).to eq('approved')
      end

      it 'status cannot be edited by a non admin' do
        logout(:user)
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)

        visit edit_post_path(@post)

        expect(page).to_not have_content('Approved')
      end

      it 'content cannot be edited by the post creator if status is approved' do
        logout(:user)
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)

        @post.update(user_id: user.id, status: 'approved')

        visit edit_post_path(@post)

        expect(current_path).to eq(posts_path)
      end
    end
  end
end