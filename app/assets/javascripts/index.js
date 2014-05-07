$(function () {
  var giveawayDate = new Date(2014, 5, 25);
  newYear = new Date(giveawayDate);
  $('#countdown').countdown({until: newYear});
});
