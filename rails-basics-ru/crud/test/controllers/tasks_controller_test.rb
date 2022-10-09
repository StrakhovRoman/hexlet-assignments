# frozen_string_literal: true

require_relative '../test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)

    @attributes = {
      name: Faker::Lorem.sentence(word_count: 3, supplemental: true),
      description: Faker::Lorem.sentence,
      status: Faker::Verb.past,
      creator: Faker::Name.name,
      performer: Faker::Name.name,
      completed: Faker::Boolean.boolean
    }
  end

  test 'can see the Tasks page' do
    get tasks_path
    assert_response :success
    assert_select 'h1', 'Tasks'
  end

  test 'should get new' do
    get new_task_path
    assert_response :success
  end

  test 'create new task' do
    post tasks_path params: { task: @attributes }
    task = Task.find_by(name: @attributes[:name])
    assert_redirected_to task_path(task)
    follow_redirect!
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'update task' do
    put task_path(@task), params: { task: @attributes }
    assert_redirected_to task_path(@task)
    follow_redirect!
    assert_response :success
    assert_select 'h1', @attributes[:name]
  end

  test 'delete task' do
    delete task_path(@task)
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
  end
end
