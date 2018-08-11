class Api::QuestionsController < ApplicationController
    protect_from_forgery prepend: true
    before_action :set_question, only: [:show, :update, :destroy]
       
        def index
          @questions = Question.all
          render json: @questions
        end
       
        def show
          @question = Question.find(params[:id])
          render json: @question
        end
       
        def create
          @question = Question.new(question_params)
       
          if @question.save
            render json: @question, status: :created
          else
            render json: @question.errors, status: :unprocessable_entity
          end
        end
       
        def update
          if @question.update(question_params)
            render json: @question, status: :ok
          else
            render json: @question.errors, status: :unprocessable_entity
          end
        end
       
        def destroy
          @question.destroy
          head :no_content
        end
       
        private
          def set_question
            @question = Question.find(params[:id])
          end
       
          def question_params
            params.require(:question).permit(:descripcion_pregunta, :peso_pregunta)
          end
end
