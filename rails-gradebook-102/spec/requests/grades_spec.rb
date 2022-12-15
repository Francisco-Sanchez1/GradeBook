 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/grades", type: :request do

  #Happy Paths
  context "When signed in" do
    before do 
      @user = create(:teacher)
      sign_in @user
    end

    describe "GET /index" do
      it "renders a successful response" do
        create(:grade, :valid)
        get grades_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        grade = create(:grade, :valid)
        get grade_url(grade)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_grade_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        grade = create(:grade, :valid)
        get edit_grade_url(grade)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Grade" do
          expect {
            post grades_url, params: { grade: attributes_for(:grade, :valid) }
          }.to change(Grade, :count).by(1)
        end

        it "redirects to the created grade" do
          post grades_url, params: { grade: attributes_for(:grade, :valid) }
          expect(response).to redirect_to(grade_url(Grade.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Grade" do
          expect {
            post grades_url, params: { grade: attributes_for(:grade, :invalid) }
          }.to change(Grade, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post grades_url, params: { grade: attributes_for(:grade, :invalid) }
          expect(response).to be_successful
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        it "updates the requested grade" do
          grade = create(:grade, :valid)
          patch grade_url(grade), params: { grade: attributes_for(:grade, :valid) }
          grade.reload
          expect(response).to redirect_to(grade_url(grade))
        end

        it "redirects to the grade" do
          grade = create(:grade, :valid)
          patch grade_url(grade), params: { grade: attributes_for(:grade, :valid) }
          grade.reload
          expect(response).to redirect_to(grade_url(grade))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          grade = create(:grade, :valid)
          patch grade_url(grade), params: { grade: attributes_for(:grade, :invalid) }
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested grade" do
        grade = create(:grade, :valid)
        expect {
          delete grade_url(grade)
        }.to change(Grade, :count).by(-1)
      end

      it "redirects to the grades list" do
        grade = create(:grade, :valid)
        delete grade_url(grade)
        expect(response).to redirect_to(grades_url)
      end
    end
  end
  
  #Sad Paths
  context "When not signed in" do
    it "should not GET /index" do
      get grades_url
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should not be able to sign-up" do
      expect{
         get '/users/sign_up'
       }.to raise_error(ActionController::RoutingError)
    end

    it "should not be able to have access to show function" do
        grade = create(:grade, :valid)
        get grade_url(grade)
        expect(response).to_not be_successful
    end

    it "should not be able to have access to new function" do
      get new_grade_url
      expect(response).to_not be_successful
    end

    it "should not be able to have access to edit function" do
        grade = create(:grade, :valid)
        get edit_grade_url(grade)
        expect(response).to_not be_successful
    end

    describe "should not be able to have access to create function" do
      context "with valid parameters" do
        it "it should not create a new Grade" do
          expect {
            post grades_url, params: { grade: attributes_for(:grade, :valid) }
          }.to change(Grade, :count).by(0)
        end
      end

      context "with invalid parameters" do
        it "does not create a new Grade" do
          expect {
            post grades_url, params: { grade: attributes_for(:grade, :invalid) }
          }.to change(Grade, :count).by(0)
        end
      end
    end

    describe "should not be able to have access to delete function" do
      it "should not destroy the requested grade" do
        grade = create(:grade, :valid)
        expect {
          delete grade_url(grade)
        }.to change(Grade, :count).by(0)
      end
    end
  end

  context "When signed in as a TA" do
    before do 
      @user = create(:ta)
      sign_in @user
    end

    describe "should not be able to have access to delete function" do
      it "should not destroy the requested grade" do
        grade = create(:grade, :valid)
        expect {delete grade_url(grade)}.to change(Grade, :count).by(0)
     end
  end
end


end
