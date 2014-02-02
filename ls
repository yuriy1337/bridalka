[33mcommit 39695a90ac3257ed1615a39aba1017b85e603958[m
Author: yuriy1337 <yuriy1337@gmail.com>
Date:   Sun Sep 29 23:42:04 2013 -0700

    added email/phone

[1mdiff --git a/app/assets/stylesheets/contact_requests/contact_requests.css.scss b/app/assets/stylesheets/contact_requests/contact_requests.css.scss[m
[1mindex 9b9bfe5..7ede3c7 100644[m
[1m--- a/app/assets/stylesheets/contact_requests/contact_requests.css.scss[m
[1m+++ b/app/assets/stylesheets/contact_requests/contact_requests.css.scss[m
[36m@@ -8,4 +8,12 @@[m
   margin-top: 1em;[m
   margin-right: auto;[m
   margin-left: auto;	[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m#contact-info {[m
[32m+[m[32m  width: 650px;[m
[32m+[m[32m  padding: 10px 10px 10px 10px;[m
[32m+[m[32m  margin-top: 1em;[m
[32m+[m[32m  margin-right: auto;[m
[32m+[m[32m  margin-left: auto;[m[41m	[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/app/views/contact_requests/new.html.erb b/app/views/contact_requests/new.html.erb[m
[1mindex 4280032..18ef3c0 100644[m
[1m--- a/app/views/contact_requests/new.html.erb[m
[1m+++ b/app/views/contact_requests/new.html.erb[m
[36m@@ -2,5 +2,13 @@[m
   <title>New Request - Bridal Kaleidoscope</title>[m
 <% end %>[m
 [m
[32m+[m[32m<div id="contact-info" class="gray-border whiteSmokeBg">[m
[32m+[m	[32m<p class="field">[m
[32m+[m		[32mEmail - <a href = "&#109&#97&#105&#108&#116&#111&#58&#109&#97&#105&#108&#64&#98&#114&#105&#100&#97&#108&#107&#97&#108&#101&#105&#100&#111&#115&#99&#111&#112&#101&#46&#99&#111&#109" >&#109&#97&#105&#108&#64&#98&#114&#105&#100&#97&#108&#107&#97&#108&#101&#105&#100&#111&#115&#99&#111&#112&#101&#46&#99&#111&#109</a>[m
[32m+[m	[32m</p>[m
[32m+[m	[32m<p class="field">[m
[32m+[m		[32mPhone - <a href="&#116&#101&#108&#58&#56&#52&#55&#45&#52&#54&#50&#45&#50&#53&#50&#54">&#56&#52&#55&#45&#52&#54&#50&#45&#50&#53&#50&#54</a>[m
[32m+[m	[32m</p>[m
[32m+[m[32m</div>[m
 [m
 <%= render 'form' %>[m
