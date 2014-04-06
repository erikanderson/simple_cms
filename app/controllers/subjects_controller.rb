class SubjectsController < ApplicationController

  layout 'admin'
  
  def index
    @subjects = Subject.sorted 
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
  end

  def create
    #Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #Save the object
    if @subject.save
    #If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    #If save fails, redisplay the form so user can fix problems
    else 
      @subject_count = Subject.count + 1
      render('new')
    end
  end


  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    #Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    #update the object
    if @subject.update_attributes(subject_params)
    #If update succeeds, redirect to the index action
    flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    #If update fails, redisplay the form so user can fix problems
    else 
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
