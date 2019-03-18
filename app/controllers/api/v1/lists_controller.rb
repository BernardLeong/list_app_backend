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

        private

        def list_params
            params.require(:list).permit(:title, :body)
        end
    end
end