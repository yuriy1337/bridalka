# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#//= require osmplayer/minplayer/minplayer.compatibility.js
#//= require osmplayer/minplayer/minplayer.flags.js
#//= require osmplayer/minplayer/minplayer.async.js
#//= require osmplayer/minplayer/minplayer.plugin.js
#//= require osmplayer/minplayer/minplayer.display.js
#//= require osmplayer/minplayer/minplayer.js
#//= require osmplayer/minplayer/minplayer.image.js
#//= require osmplayer/minplayer/minplayer.file.js
#//= require osmplayer/minplayer/minplayer.playLoader.js
#//= require osmplayer/minplayer/minplayer.players.base.js
#//= require osmplayer/minplayer/minplayer.players.html5.js
#//= require osmplayer/minplayer/minplayer.players.flash.js
#//= require osmplayer/minplayer/minplayer.players.minplayer.js
#//= require osmplayer/minplayer/minplayer.players.youtube.js
#//= require osmplayer/minplayer/minplayer.players.vimeo.js
#//= require osmplayer/minplayer/minplayer.controller.js
#//= require osmplayer/osmplayer.js
#//= require osmplayer/osmplayer.parser.default.js
#//= require osmplayer/osmplayer.parser.youtube.js
#//= require osmplayer/osmplayer.parser.rss.js
#//= require osmplayer/osmplayer.parser.asx.js
#//= require osmplayer/osmplayer.parser.xspf.js
#//= require osmplayer/osmplayer.playlist.js
#//= require osmplayer/iscroll/iscroll.js
#//= require osmplayer/osmplayer.pager.js
#//= require osmplayer/osmplayer.teaser.js
#//= require osmplayer/default/osmplayer.default.js
#//= require osmplayer/default/osmplayer.controller.default.js
#//= require osmplayer/default/osmplayer.pager.default.js
#//= require osmplayer/default/osmplayer.playLoader.default.js
#//= require osmplayer/default/osmplayer.playlist.default.js
#//= require osmplayer/default/osmplayer.teaser.default.js

$ ->
  $("#osmplayer").osmplayer
    playlist: '/assets/videos/playlist.xml',
    width: "100%",
    height: "500px"

#    playlist: 'https://gdata.youtube.com/feeds/api/users/BridalKaleidoscope/uploads'
        #playlist: 'http://gdata.youtube.com/feeds/api/users/BridalKaleidoscope/playlists/PLC315335DA4E83548'

