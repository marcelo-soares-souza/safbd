require "test_helper"

class SistemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sistema = sistemas(:one)
  end

  test "should get index" do
    get sistemas_url
    assert_response :success
  end

  test "should get new" do
    get new_sistema_url
    assert_response :success
  end

  test "should create sistema" do
    assert_difference("Sistema.count") do
      post sistemas_url, params: { sistema: { cep: @sistema.cep, cidade: @sistema.cidade, descricao: @sistema.descricao, latitude: @sistema.latitude, logradouro: @sistema.logradouro, longitude: @sistema.longitude, nome: @sistema.nome, slug: @sistema.slug, uf: @sistema.uf, user_id: @sistema.user_id } }
    end

    assert_redirected_to sistema_url(Sistema.last)
  end

  test "should show sistema" do
    get sistema_url(@sistema)
    assert_response :success
  end

  test "should get edit" do
    get edit_sistema_url(@sistema)
    assert_response :success
  end

  test "should update sistema" do
    patch sistema_url(@sistema), params: { sistema: { cep: @sistema.cep, cidade: @sistema.cidade, descricao: @sistema.descricao, latitude: @sistema.latitude, logradouro: @sistema.logradouro, longitude: @sistema.longitude, nome: @sistema.nome, slug: @sistema.slug, uf: @sistema.uf, user_id: @sistema.user_id } }
    assert_redirected_to sistema_url(@sistema)
  end

  test "should destroy sistema" do
    assert_difference("Sistema.count", -1) do
      delete sistema_url(@sistema)
    end

    assert_redirected_to sistemas_url
  end
end
