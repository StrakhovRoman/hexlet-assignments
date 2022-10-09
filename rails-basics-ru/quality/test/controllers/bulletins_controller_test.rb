# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @bulletin = bulletins(:one)
  end

  test 'opens all pages' do
    get bulletins_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens page' do
    get bulletin_path(@bulletin)

    assert_response :success
    assert_select 'h1', @bulletin.title
    assert_select 'p', @bulletin.body
  end
end
