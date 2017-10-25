 $(function(){
//        边框效果--移入
        function biankuang(){
            $('.biankuang_1').stop(true).animate({
                height:'305px'
            },300)
            $('.biankuang_2').stop(true).delay(300).animate({
                width:'360px'
            },300)
            $('.biankuang_3').stop(true).animate({
                height:'305px'
            },300)
            $('.biankuang_4').stop(true).delay(300).animate({
                width:'360px'
            },300)
        }
//        边框效果--移出
        function biankuang1(){

            $('.biankuang_1').stop(true).delay(100).animate({
                height:'0px'
            },100)
            $('.biankuang_2').stop(true).animate({
                width:'0px'
            },100)
            $('.biankuang_3').stop(true).delay(100).animate({
                height:'0px'
            },100)
            $('.biankuang_4').stop(true).animate({
                width:'0px'
            },100)
        }
//        触发

            $('.cn_gobuy').hover(
                    function () {
                            $('.text_gobuy').addClass('text_gobuy_show');
                            $('.search_y').animate({left:'150',opacity:1},300);
                        biankuang();
                    },
                    function () {
                        $('.text_gobuy').removeClass('text_gobuy_show');
                        $('.search_y').animate({left:'100',opacity:0},300);
                        biankuang1();
                    }
            );
            

    })