require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    assert_difference("Assignment.count") do
      post assignments_url, params: { assignment: { content: @assignment.content, deadline: @assignment.deadline, teach/course_id: @assignment.teach/course_id, title: @assignment.title } }
    end

    assert_redirected_to assignment_url(Assignment.last)
  end

  test "should show assignment" do
    get assignment_url(@assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_url(@assignment)
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@assignment), params: { assignment: { content: @assignment.content, deadline: @assignment.deadline, teach/course_id: @assignment.teach/course_id, title: @assignment.title } }
    assert_redirected_to assignment_url(@assignment)
  end

  test "should destroy assignment" do
    assert_difference("Assignment.count", -1) do
      delete assignment_url(@assignment)
    end

    assert_redirected_to assignments_url
  end
end
