class TopicsController < ApplicationController
	def index
     @topics = Topic.all
   	end

    def show
     @topic = Topic.find(params[:id])
   	end

   	def new
     @topic = Topic.new
    end  


   def edit
     @topic = Topic.find(params[:id])
   end
 

   def update
     @topic = Topic.find(params[:id])
 
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
     if @topic.save
        flash[:notice] = "Topic was updated successfully."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
   end


   def create
     @topic = Topic.new
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
     if @topic.save
       flash[:notice] = "Topic was saved successfully."
       redirect_to @topic
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end

      describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_topic.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_topic.id}
       expect(response).to render_template :edit
     end
 
     it "assigns topic to be updated to @topic" do
       get :edit, {id: my_topic.id}
       topic_instance = assigns(:topic)
 
       expect(topic_instance.id).to eq my_topic.id
       expect(topic_instance.name).to eq my_topic.name
       expect(topic_instance.description).to eq my_topic.description
     end
   end

     def destroy
     @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
   end
end
