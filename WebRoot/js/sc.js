	$(function(){
    var $tabItem = $('#things .tab-item');//获得导航条部分
    var $fmaint = $('#things .fmaint');//获得内容部分
    var $at = $('#variety a');
    var $spant = $('#variety span');
    var $dropdown = $('.dropdown');
    $tabItem.each(function (index) {//用each方法给每个导航条添加鼠标移入移除事件
        $(this).mouseover(function () {
            $dropdown.removeClass('hiden');
            $(this).addClass('showLi');
            $fmaint.eq(index).removeClass('hiden').siblings().addClass('hiden');
            $at.eq(index).addClass('showA');
            $spant.eq(index).addClass('showSpan');
        }).mouseout(function () {
            $dropdown.addClass('hiden');
            $(this).removeClass('showLi');
            $fmaint.eq(index).addClass('hiden');
            $at.eq(index).removeClass('showA');
            $spant.eq(index).removeClass('showSpan');
        });
    });
    $fmaint.each(function (index) {//用each方法给每个内容添加鼠标移入移除事件
        $(this).mouseover(function () {
            $dropdown.removeClass('hiden');
            $tabItem.eq(index).addClass('showLi');
            $fmaint.eq(index).removeClass('hiden').siblings().addClass('hiden');
            $at.eq(index).addClass('showA');
            $spant.eq(index).addClass('showSpan');
        }).mouseout(function () {
            $dropdown.addClass('hiden');
            $at.eq(index).removeClass('showA');
            $spant.eq(index).removeClass('showSpan');
            $tabItem.eq(index).removeClass('showLi');
            $fmaint.eq(index).addClass('hiden');
        });
    });
})