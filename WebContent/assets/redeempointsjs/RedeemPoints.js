$(document).ready(function () {
    var value = 0;
    var countClicked = 0;
    var clicked = false;
    var score =0;
    var path = document.getElementsByTagName("a");
    function getPosition(position) {
        if (position <= 30) {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 100 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=100";
        }
        else if (position <= 90) {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 600 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=600";
        }
        else if (position <= 150) {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 500 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=500";
        } else if (position <= 210) {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 400 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=400";
        } else if (position <= 270) {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 300 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=300";
        }
        else if (position <= 330) {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 200 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=200";
        }
        else {
            $('.congratulation__note').text('CHÚC MỪNG BẠN VỪA NHẬN ĐƯỢC 50 ĐIỂM');
            path[0].href="LuckyWheelHandling?index=50";
        }
        $('.popup').removeClass('active');
        $('.congratulation').fadeIn();
        clicked = false;
        countClicked = 0;
    }
    //

    
    $('.wheel__button').click(function () {
        if (clicked == true) {
            countClicked++;
            if (countClicked <= 2) {
                $('.popup__note').text("NGỪNG PHÁ ĐI MEN!");
            }
            else if (countClicked <= 4)
                $('.popup__note').text("LÌ QUÁ NGHEN!");
            else
                $('.popup__note').text("BÓ TAY, RÁNG PHÁ BANH NÚT NHA!");
            if (!$('.popup').hasClass('active'))
                $('.popup').addClass('active');
        }
        else {
            let random = Math.floor((Math.random() * 360) + 720);
            value += random;
            console.log(random % 360);
            console.log(value % 360);
            $(".wheel__inner").css("transform", `rotate(${value}deg)`);
            setTimeout(() => {
                // Chia lấy dư cho 360 để lấy lượng quay không hoàn thành một
				// vòng 360deg
                getPosition(value % 360);
            }, 5000);
        }
        clicked = true;
    })
    $('.congratulation__close').click(function () {
        $('.congratulation').fadeOut();
    })
     $('.notification__close').click(function () {
        $('.notification').fadeOut();
    })
    $('.congratulation').click(function (event) {
        if (event.target != this)
            return;
        $(this).fadeOut();
    })
})