
var ready = function() {
    $( "#test" ).on( "click", function() {
        setInterval(updater, 2000)
    });


    function updater() { $.getJSON('http://localhost:3000/rooms/1/rooms_messages.json', function (json){
            var u = $("#viestit");
            var str = "<ul id='viestit'>";
            for (var i = 0; i < json.length; i++) {
                str += "<li>" + "<strong>" + json[i].name + ": </strong>" + json[i].text + "</li>";
            }
            str += "</ul>";
        u.replaceWith(str);
        })
    }
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);

