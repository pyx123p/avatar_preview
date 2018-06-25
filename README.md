
# avatar_preview
preview image before upload without using any plugins

<h1>In Models User.rb</h1>
<h2>write a methods to save the image file:</h2> 
<h4>
   def self.set_avatar_path(file)
    file_name = file.original_filename
    file_path = File.join(Rails.root,'public','avatars',file_name)
    File.open(file_path,'wb') do |f|
      f.write(file.read)
    end
    return file_name
  end
</h4>
<h2>another method to get image file in order to previewing image file:</h2> 
<h4>
  def self.get_avatar_path(file_name)
     "/avatars/#{file_name}"
  end
</h4>
<h1>In views users/new.html.erb</h1>
 <h2>change the form's action to preview the image</h2>
 <h4><script>
    $(function () {
       $('#image').on('change',function () {
           var original_action = this.form.action;
           this.form.target = "avatar_preview";
           this.form.action = "/users/avatar_preview";
           this.form.submit();
           this.form.action = original_action;
           this.form.target = 'self';

       })
   })
</script>
</h4>
