require 'rails_helper'

  describe 'admin login dashboard' do

    context 'as authenticated admin' do

      it 'can view admin dashboard' do
        login_admin!
        expect(current_path).to eq('/admin/dashboard')
        expect(page).to have_link('Admin Categories')
        expect(page).to have_link('Admin Items')
        expect(page).to have_link('Admin Orders')
        admin_logout!
      end

    end

    context 'as unauthenticated or non-admin user' do

      it 'visitor sees error page' do
        visit '/admin/dashboard'
        expect(current_path).to eq('/error')
      end

      it 'non-admin sees error page' do
        login_user!
        visit '/admin/dashboard'
        expect(current_path).to eq('/error')
      end

    end

  end
