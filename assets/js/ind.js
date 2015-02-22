/**
 * Created by haha on 2015/2/22.
 */
var startX = 0, startY = 0, x = 0, y = 0;
var $ind = $('#ind');
var $window = $(window);

Hammer($ind.get(0)).on('dragstart', function(event) {
    var pos = $('#ind').position();
    x = pos.left;
    y = pos.top;
    startX = event.gesture.center.pageX - x;
    startY = event.gesture.center.pageY - y;
});

Hammer($ind.get(0)).on('drag', function(event){
    y = event.gesture.center.pageY - startY;
    if(y < 50) y = 50;
    if(y > $window.height() - $ind.innerHeight()) y = $window.height() - $ind.innerHeight();
    x = event.gesture.center.pageX - startX;
    if(x < 0) x = 0;
    if(x > $window.width() - $ind.innerWidth()) x = $window.width() - $ind.innerWidth();
    $ind.css({
        top: y + 'px',
        left:  x + 'px'
    });
});