(function($) {
    "use strict";
    
    
    
    /* mobile menu active */
    $('nav#dropdown').meanmenu({
        meanScreenWidth: "767",
        meanMenuContainer: '.mobile-menu'
    });
    
    
    /* imagesLoaded  */
    $('.grid').imagesLoaded(function() {
        // filter items on button click
        $('.shop-menu').on('click', 'button', function() {
            var filterValue = $(this).attr('data-filter');
            $grid.isotope({
                filter: filterValue
            });
        });
        // init Isotope
        var $grid = $('.grid').isotope({
            itemSelector: '.grid-item',
            percentPosition: true,
            masonry: {
                // use outer width of grid-sizer for columnWidth
                columnWidth: '.grid-item',
            }
        });
    });
    
    
    /* shop menu  */
    $('.shop-menu button').on('click', function(event) {
        $(this).siblings('.active').removeClass('active');
        $(this).addClass('active');
        event.preventDefault();
    });
    
    
    /* price slider */
    var sliderrange = $('#slider-range');
    var amounts = $('#amount');
    sliderrange.slider({
        range: true,
        min: 40,
        max: 600,
        values: [20, 570],
        slide: function(event, ui) {
            amounts.val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });
    amounts.val("$" + sliderrange.slider("values", 0) +
    " - $" + sliderrange.slider("values", 1));
    
    
    /* testimonial-active */
    $('.testimonial-active').owlCarousel({
        loop: true,
        nav: false,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    })
    
    
    /* magnific video popup */
    $('.video-popup').magnificPopup({
        type: 'iframe'
    });
    
    
    /* product curosel */
    $('.product-curosel').owlCarousel({
        loop: true,
        nav: true,
        items: 4,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            1000: {
                items: 4
            }
        }
    })
    
    
    /* special slider active */
    $('.special-slider-active').owlCarousel({
        loop: true,
        nav: false,
        items: 2,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            1000: {
                items: 2
            }
        }
    })
    
    
    /* countdown */
    $('[data-countdown]').each(function() {
        var $this = $(this),
            finalDate = $(this).data('countdown');
        $this.countdown(finalDate, function(event) {
            $this.html(event.strftime('<span class="cdown day">%-D <p>Days</p></span> <span class="cdown hour">%-H <p>Hour</p></span> <span class="cdown minutes">%M <p>Min</p></span class="cdown second"> <span>%S <p>Sec</p></span>'));
        });
    });
    
    
    /*-- header Stick ---*/
    var header = $('.stickey');
    var wind = $(window);
    
    wind.on('scroll', function() {
        var scroll = wind.scrollTop();
        if (scroll < 1) {
            header.removeClass('stick');
        } else {
            header.addClass('stick');
        }
    });
    
    /*--- customer login active ----*/
    $('#customer').on('click', function() {
        $('#customer-login').slideToggle(900);
    });
    
    /*--- coupon active----*/
    $('#coupon').on('click', function() {
        $('#have-coupon').slideToggle(900);
    });
    
    /* scrollup  active */
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });
    
    
    /* parallax active  */
    $('.parallax-window').parallax();
    
    
    
    
    /*
	CONTACT FORM VALIDATIONS SETTINGS
	========================================*/
	var CTForm = $('#contact_form');
    CTForm.validate({
        onfocusout: false,
        onkeyup: false,
        rules: {
            name: "required",
            phone: {
                required: true,
                phoneNum: true
            }
        },
        errorPlacement: function(error, element) {
            error.insertBefore(element);
        },
        messages: {
            name: "请输入称呼",
            phone: {
                required: "请输入手机号",
                phoneNum: "请输入正确的手机号"
            }
        },
					
        highlight: function(element) {
            $(element)
            .text('').addClass('error')
        },                    
					
        success: function(element) {
            element
            .text('').addClass('valid')
        }
    });   

	/*
	CONTACT FORM SCRIPT
	========================================*/
 	var CTSubmit = $('#contact_submit');
    CTForm.submit(function() {
        // submit the form
        if($(this).valid()){
           CTSubmit.button('loading'); 
            var action = $(this).attr('action');
            $.ajax({
                url: action,
                type: 'POST',
                data: {
                    contactname: $('#contact_name').val(),
                    contactemail: $('#contact_email').val(),
                    contactmessage: $('#contact_message').val()
                },
                success: function() {
                   CTSubmit.button('reset');
                   CTSubmit.button('complete');
                },
                error: function() {
					CTSubmit.button('reset');
					CTSubmit.button('error');
                }
            });
        // return false to prevent normal browser submit and page navigation 
        } else {
            CTSubmit.button('reset')
        }
        return false; 
    });
    
    
    
    
    
})(jQuery);

jQuery.validator.addMethod("phoneNum", function(value, element) {
    var length = value.length;
    var mobile = /^1[3|5|8]{1}[0-9]{9}$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");