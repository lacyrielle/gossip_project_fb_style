class GossipController < ApplicationController
    before_action :authenticate_user, only: [:index, :new, :show]
  
      def welcome
        @user = params[:user]
      end

      def new
        @gossip = Gossip.new
      end
      
      def index
        @gossips = Gossip.all
      end
      
      def show
        @gossip = Gossip.find(params[:id])
        @comment = Comment.new
      end
  
      def create
        @gossip = Gossip.new(gossip_params.merge(user: current_user))
      if @gossip.save
        render template: 'others/successful_creation', locals: {class_name: @gossip.class}
      else
        render :new
      end

      def edit
        @gossip = Gossip.find(params[:id])
      end

      def destroy
        @gossip = Gossip.find(params[:id])
      if is_owner?
        @gossip.destroy
        redirect_to root_path
      end

      private
      def gossip_params
        params.require(:gossip).permit(:title, :content)
      end
    end
end

