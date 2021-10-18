class TasksController < ApplicationController
        before_action :set_task, only: %i[  show edit update destroy ]
    
        def index
          @tasks = Task.all
          authorize  @tasks

        end
    
        def new
            @task = Task.new
            authorize  @task

          # byebug
        end
    
        def show
        authorize @task

        end
    
        def create

            @task = Task.new(task_params)
            authorize  @task

            respond_to do |format|

            puts @task.title
            puts @task.due_date
            puts @task.task_type
            puts @task.img
            
              if @task.save!
                format.html { redirect_to tasks_path, notice: "Task was successfully created." }
              else
                puts "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                format.html { render :new, status: :unprocessable_entity }
              end
            
        end
      end
    
      def edit
      
        authorize  @task

        # @portfolio_item = Portfolio.find(params[:id]) 
     end
    
     def update
      authorize  @task

        # @portfolio_item = Portfolio.find(params[:id]) 
         respond_to do |format|
           if @task.update(task_params)
             #current_user.add_role :editor, @portfolio_item
    
             format.html { redirect_to tasks_path, notice: "Task item was successfully updated." }
           else
             format.html { render :edit, status: :unprocessable_entity }
           end
         end
     end
    
    
    
     def destroy
            # @portfolio_item = Portfolio.find(params[:id]) 
            authorize  @task

             @task.destroy
            # current_user.add_role :destroyer, @portfolio_item
        
             respond_to do |format|
               format.html { redirect_to tasks_url, notice: "Task item was successfully deleted." }
             end
           end
        
           private
         def set_task
           @task = Task.find(params[:id])
         end
        
        def task_params
        params.require(:task).permit(:title, :due_date,:task_type,:img,:business_id)
        
        end
    
    
    end

