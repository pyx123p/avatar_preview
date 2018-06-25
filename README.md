
# avatar_preview
preview image before upload without using any plugins

<h1>In Models User.rb</h1>
<h2 style="color:blue">write a methods to save the image file:</h2> 
<h4>
   def self.set_avatar_path(file)<br>
    &nbsp;&nbsp;file_name = file.original_filename<br>
    &nbsp;&nbsp;file_path = File.join(Rails.root,'public','avatars',file_name)<br>
    &nbsp;&nbsp;File.open(file_path,'wb') do |f|<br>
      &nbsp;&nbsp;&nbsp;&nbsp;f.write(file.read)<br>
    &nbsp;&nbsp;end<br>
    &nbsp;&nbsp;return file_name<br>
  end<br>
</h4>
<h2>another method to get image file in order to previewing image file:</h2> 
<h4>
  def self.get_avatar_path(file_name)<br>
     &nbsp;&nbsp;"/avatars/#{file_name}"<br>
  end<br>
</h4>
<h1>In views users/new.html.erb</h1>
 <h2 style="color:blue">change the form's action to preview the image</h2>
 <h4><script><br>
    &nbsp;&nbsp;$(function () {<br>
       &nbsp;&nbsp;&nbsp;&nbsp;$('#image').on('change',function () {<br>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var original_action = this.form.action;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.form.target = "avatar_preview";<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.form.action = "/users/avatar_preview";<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.form.submit();<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.form.action = original_action;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.form.target = 'self';<br>
       &nbsp;&nbsp;&nbsp;&nbsp;})<br>
   &nbsp;&nbsp;})<br>
</script><br>
</h4>
