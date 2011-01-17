// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function scroll_to_bottom(el_id){
    var el = document.getElementById(el_id);
    if(el){
        el.scrollTop = el.scrollHeight;
    }
}

function set_focus(el_id){
    var el = document.getElementById(el_id);
    if(el){
        el.focus();
    }
}

var PartyUpdater = Class.create({
  initialize: function() {
    this.delay = 5;
    this.messageUrl = document.location.href + '/messages';
    this.scheduleNextTimerEvent();
  },
  scheduleNextTimerEvent: function() {
    this.onTimerEvent.bind(this).delay(this.delay);
  },
  onTimerEvent: function() {
    var sinceValue = $('roll_since').value;
    var urlWithSince = this.messageUrl + '?' + $H({since: sinceValue}).toQueryString();
    this.request = new Ajax.Request(urlWithSince, {
      method: 'get',
      onSuccess: this.onSuccess.bind(this)});

  },
  onSuccess: function() {
    this.scheduleNextTimerEvent();
  }
});