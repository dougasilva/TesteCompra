require 'rails_helper'

feature 'Products', type: :feature do

  before(:each) do
    @product = create(:product)
  end

  scenario 'Testing Product Registration Link' do
    visit(root_path)
    expect(page).to  have_link('Cadastro de Produtos')
  end

  scenario 'Check Link For New Product' do
    visit(root_path)
    click_on('Cadastro de Produtos')
    expect(page).to  have_content('Lista de Produtos')
    expect(page).to  have_link('Novo Produto')
  end

  scenario 'Verify New Product Form' do
    visit(products_path)
    click_on('Novo Produto')
    expect(page).to have_content('Novo Produto')
  end

  scenario 'Register A Valid Product' do
    visit(new_product_path)
    product_name = Faker::Appliance.equipment
    fill_in 'Nome',	with: product_name
    fill_in 'Descrição',	with: Faker::Lorem.paragraph(2)
    fill_in 'Preço',	with: 29.90
    fill_in 'Quantidade', with:	10

    click_on('Cadastrar')
    expect(page).to have_content('Produto cadastrado')
    expect(Product.last.name).to eq(product_name)
  end

  scenario 'Does Not Register An Invalid Product' do
    visit(new_product_path)
    click_on('Cadastrar')
    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'Show Product' do
    visit(product_path(@product.id))
    expect(page).to have_content(@product.name)
    expect(page).to have_content(@product.description)
    expect(page).to have_content(@product.unit_price)
    expect(page).to have_content(@product.quantity)
  end

  scenario 'Edit Valid Product' do
    new_price = 49.90
    new_description = 'bla bla bla'
    visit(edit_product_path(@product.id))
    fill_in 'Descrição', with: new_description
    fill_in 'Preço',	with: new_price
    click_on('Cadastrar')
    expect(page).to have_content('Produto atualizado')
  end

  scenario 'Show All Products' do
    @product2 = create(:product, name: 'Panela',
                                description: 'Rochedo',
                                unit_price: 39.90,
                                quantity: 30)
    visit products_path

    expect(page).to have_content @product.name
    expect(page).to have_content @product.unit_price
    expect(page).to have_content @product.quantity
    expect(page).to have_content @product2.name
    expect(page).to have_content @product2.unit_price
    expect(page).to have_content @product2.quantity
  end

  scenario 'Delete a Product', js: true do
    visit(products_path)
    click_on('Excluir')
    page.driver.browser.switch_to.alert.acept

    expect(page).to  have_content('Produto excluído')
  end
end
