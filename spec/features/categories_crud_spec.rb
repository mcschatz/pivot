require 'rails_helper'

feature 'Categories restfulness' do

  context 'authenticated admin' do

    before :each do
      login_admin!
      visit '/admin/categories'
    end

    after :each do
      admin_logout!
    end

    it 'displays all categories' do
      expect(current_path).to eq(admin_categories_path)
      Category.all.each do |cat|
        expect(page).to have_content(cat.title)
      end
    end

    it "shows each category\'s items" do
      Category.all.each do |cat|
        cat.items.each do |item|
          expect(page).to have_content(item.title)
        end
      end
    end

    it "can view an individual category which includes corresponding items" do
      cat = Category.first
      expect(page).to have_link(cat.title, cat)
      click_link(cat.title, cat)
      expect(current_path).to eq(category_path(cat.slug))
      cat.items.each do |item|
        expect(page).to have_link(item.title, item)
      end
      click_on "Categories Index"
      expect(current_path).to eq(admin_categories_path)
    end

    it "can edit categories" do
      Category.all.each do |cat|
        expect(page).to have_link("Edit", edit_admin_category_path(cat))
      end
      category = Category.first
      cat_title = category.title
      expect(page).to have_link(cat_title)
      first(:link, "Edit").click
      expect(current_path).to eq(edit_admin_category_path(category))
      fill_in "category_title", with: "juju"
      click_on("Update Category")
      expect(page).to_not have_link(cat_title)
      expect(page).to have_link("juju")
    end

    it "can delete categories" do
      Category.all.each do |cat|
        expect(page).to have_link("Delete", admin_category_path(cat))
      end
      cat_count = Category.count
      first(:link, "Delete").click
      expect(Category.count).to eq(cat_count - 1)
    end

    it "can create a new category" do
      expect(page).to have_link("Create New Category")
      click_link("Create New Category")
      expect(current_path).to eq("/admin/categories/new")
    end

    it "can visit items from categories index" do
      Category.first.items.each do |item|
        expect(page).to have_link(item.title, item)
      end
      test_item = Category.first.items.first
      first(:link, test_item.title).click
      expect(current_path).to eq(item_path(test_item.slug))

    end
  end

  context 'unauthenticated user' do

    it "cannot visit admin/categories" do
      visit '/admin/categories'

      expect(current_path).to eq('/error'), "only admin should see categories index"
      expect(page).to have_content("You are not authorized to be here :(")

    end

    it "does not see link to category index" do
      visit '/categories/business'
      expect(page).not_to have_link('Categories Index')
    end

  end

  context 'authenticated non-admin user' do

    it "cannot visit admin/categories" do
      login_user!
      visit '/admin/categories'

      expect(current_path).to eq('/error'), "only admin should see categories index"
      expect(page).to have_content("You are not authorized to be here :(")
    end

    it "does not see link to category index" do
      visit '/categories/education'
      expect(page).not_to have_link('Categories Index')
    end

  end

end
