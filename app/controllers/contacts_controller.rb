class ContactsController < ApplicationController
  
  def new
  end
  
  

  def create
    @contact=Contact.new(contact_params) #creating new contact
    name=params[:contact][:Image].original_filename #will assign the name of the image to the variable name
   @contact.Image=name#assigning name to contact.image 
    if @contact.save #for saving the contact fields in db
      redirect_to @contact 
    else
      render 'new'
    end
  end
 
  def show
    @contact=Contact.find(params[:id]) #finds by id and shows the contact 
  end
  
 
  def index
    @contacts=Contact.all #to display all the contacts
  end

  def edit
    @contact=Contact.find(params[:id])
  end

  def update
  @contact=Contact.find(params[:id])
  name=params[:contact][:Image].original_filename#getting the original name
  @contact.Image=name
      if @contact.update(contact_params)
        redirect_to @contact 
      else
        render 'edit' 
      end
  end

  def destroy
    @contact=Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  def img
   name=params[:contact][:Image].original_filename
   directory="public/data"
   return path=File.join(directory,name)	#join is a helper function, will concatenate directoryname along with file name and returns the full path
  end
  
  def contact_params
   File.open(img,"wb"){|f| f.write(params[:contact][:Image].read)}# opening a file in write mode and reading data from data file and writing into the output file	
   params.require(:contact).permit(:FirstName, :LastName, :EmailId, :MobileNumber, :Address)#strong parameter will allow only the permitted parameter
	end
end
