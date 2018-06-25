
# avatar_preview
preview image before upload without using any plugins

<h1>In Models User.rb</h1>
<h2>write a methods to save the image file:</h2> 
<h4>
   def self.set_avatar_path(file)<br>
    file_name = file.original_filename<br>
    file_path = File.join(Rails.root,'public','avatars',file_name)<br>
    File.open(file_path,'wb') do |f|<br>
      f.write(file.read)<br>
    end<br>
    return file_name<br>
  end<br>
</h4>
<h2>another method to get image file in order to previewing image file:</h2> 
<h4>
  def self.get_avatar_path(file_name)<br>
     "/avatars/#{file_name}"<br>
  end<br>
</h4>
<h1>In views users/new.html.erb</h1>
 <h2>change the form's action to preview the image</h2>
 <h4><script><br>
    $(function () {<br>
       $('#image').on('change',function () {<br>
           var original_action = this.form.action;<br>
           this.form.target = "avatar_preview";<br>
           this.form.action = "/users/avatar_preview";<br>
           this.form.submit();<br>
           this.form.action = original_action;<br>
           this.form.target = 'self';<br>
       })<br>
   })<br>
</script><br>
</h4>
