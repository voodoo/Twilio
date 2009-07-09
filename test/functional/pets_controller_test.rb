require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Pet.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Pet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Pet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pet_url(assigns(:pet))
  end
  
  def test_edit
    get :edit, :id => Pet.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Pet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pet.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Pet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pet.first
    assert_redirected_to pet_url(assigns(:pet))
  end
  
  def test_destroy
    pet = Pet.first
    delete :destroy, :id => pet
    assert_redirected_to pets_url
    assert !Pet.exists?(pet.id)
  end
end
