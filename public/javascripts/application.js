// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function scroll_to_bottom(el_id){
    var el = document.getElementById(el_id);
    if(el){
        el.scrollTop = el.scrollHeight;
    }
}