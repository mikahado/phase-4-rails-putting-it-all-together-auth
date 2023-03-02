class RecipesController < ApplicationController

    # before_action :authorize 


    def index 
        render json: Recipe.all
    end

    # def create 
    #     user = User.find_by(id: session[:user_id])
    #     if user 
    #         render json: user.recipes.create(recipes_params), status: :created
    #     else    
    #         render json: {error: "Unauthorized"}, status: :unauthorized
    #     end
    # end

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
      end

    private 

    def recipe_params
        params.permit(:minutes_to_complete, :instructions, :title)
    end

    # def authorize 
    #     return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    # end

end
