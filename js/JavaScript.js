var SENDMAIL_URL = "http://divaspa.roofcode.com/do/send-mail/";
function ShowLoading() {
    $('#loading-screen').css('display', 'flex');

    $('html, body').css({
        'overflow': 'hidden',
        'height': '100%',
    });
}

function HideLoading() {
    $('#loading-screen').hide();

    $('html, body').css({
        'overflow': 'auto',
        'height': 'auto',
    });
}

function IsValidEmail(email) {
    var ree = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (!ree.test(email)) return true;
    return false;
}

function CheckEmailValid(email) {
    var result = IsValidEmail(email);

    if (result) return "Your email is invalid! <br>";
    return "";
}

function CheckFieldEmpty() {
    console.log("Check");
    $('input').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).val() == null || $(this).val().length == 0) {
                $(this).addClass('error');
            }
        }
    });

    $('textarea').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).hasClass('tinymce')) {
                var fieldValue = tinymce.get($(this).attr('id')).getContent();
                if (fieldValue == null || fieldValue.length == 0) {
                    $('.mce-tinymce .mce-container .mce-panel').addClass('error');
                }
            } else {
                if ($(this).hasClass('required')) {
                    if ($(this).val() == null || $(this).val().length == 0) {
                        $(this).addClass('error');
                    }
                }
            }
        }
    });

    $('select').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).val() == 0) {
                $(this).addClass('error');
            }
        }

    });
}

function CheckFieldEmpty(selector) {
    $(selector).find('input').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).val() == null || $(this).val().length == 0) {
                $(this).addClass('error');
            }
        }
    });

    $(selector).find('textarea').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).hasClass('tinymce')) {
                var fieldValue = tinymce.get($(this).attr('id')).getContent();
                if (fieldValue == null || fieldValue.length == 0) {
                    $('.mce-tinymce .mce-container .mce-panel').addClass('error');
                }
            } else {
                if ($(this).hasClass('required')) {
                    if ($(this).val() == null || $(this).val().length == 0) {
                        $(this).addClass('error');
                    }
                }
            }
        }
    });

    $(selector).find('select').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).val() == 0) {
                $(this).addClass('error');
            }
        }

    });
}

function CheckFieldError() {
    var errorFlag = 0;
    $('input').each(function () {
        if ($(this).hasClass('error')) errorFlag = 1;
    });

    $('textarea').each(function () {
        if ($(this).hasClass('error')) errorFlag = 1;
    });

    $('select').each(function () {
        if ($(this).hasClass('error')) errorFlag = 1;
    });

    if (errorFlag == 1) return "Please fill in required field(*).<br>";
    return "";
}

function CheckPasswordMatch(password, rePassword) {
    if (password != rePassword) return "Password doesn't match. <br>";
    return "";
}

function CheckEmailValid(email) {
    var result = IsValidEmail(email);

    if (result) return "Your email is invalid! <br>";
    return "";
}