module Api::V1
    class ListsController < ApplicationController
        def index
            @lists = List.order("created_at DESC")
            render json: @lists
        end

        def create
            @list = List.create(list_params)
            render json: @list
        end

        def update
            @list=List.find(params[:id])
            @list.update_attributes(list_params)
            render json: @list
        end

        def destroy
            @list = List.find(params[:id])
            if @list.destroy
              head :no_content, status: :ok
            else
              render json: @list.errors, status: :unprocessable_entity
            end
          end
          

        private

        def list_params
            params.require(:list).permit(:title, :body)
        end
    end
end