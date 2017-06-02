require "test_helper"

class ExperimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @experimento = experimentos(:one)
  end

  test "should get index" do
    get experimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_experimento_url
    assert_response :success
  end

  test "should create experimento" do
    assert_difference("Experimento.count") do
      post experimentos_url, params: { experimento: { descricao: @experimento.descricao, nome: @experimento.nome, sistema_id: @experimento.sistema_id, slug: @experimento.slug } }
    end

    assert_redirected_to experimento_url(Experimento.last)
  end

  test "should show experimento" do
    get experimento_url(@experimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_experimento_url(@experimento)
    assert_response :success
  end

  test "should update experimento" do
    patch experimento_url(@experimento), params: { experimento: { descricao: @experimento.descricao, nome: @experimento.nome, sistema_id: @experimento.sistema_id, slug: @experimento.slug } }
    assert_redirected_to experimento_url(@experimento)
  end

  test "should destroy experimento" do
    assert_difference("Experimento.count", -1) do
      delete experimento_url(@experimento)
    end

    assert_redirected_to experimentos_url
  end
end
