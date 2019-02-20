
var BASE_URL = 'http://localhost:8080';
var MODULE_WEB = '/everyboo-module-interface';
var MODULE_ADMIN = '/everyboo-module-admin';

var USER_INFO = 'everyboo_user_info';

var PRODUCT_URL = BASE_URL + MODULE_WEB+ '/api/shopproduct/list';

var PRODUCT_DETAIL_URL = BASE_URL + MODULE_WEB+ '/api/shopproduct/getDetail';

var ARTICLE_URL = BASE_URL + MODULE_WEB+ '/cms/api/article/list';

var ARTICLE_DETAIL_URL = BASE_URL + MODULE_WEB+ '/cms/api/article/detail';

var SHOPBILL_URL = BASE_URL + MODULE_WEB+ '/api/shopbilltrade/list';

var SHOPBILL_TRAN = BASE_URL + MODULE_WEB+ '/api/shopbilltrade/save';

var ORDER_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/list';

var ORDER_DETAIL_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/getDetail';

var ORDER_CREATE_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/save';

var ORDER_CONFIRM_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/upd/status';

var CART_ADD_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/addCart';

var CART_UPDATE_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/updateCart';

var CART_LIST_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/listCart';

var CART_REMOVE_URL = BASE_URL + MODULE_WEB+ '/api/shoptrade/removeCart';

var SMS_CODE_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/sendSms';

var REGISTER_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/register';

var PHONE_VALIDATE_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/validator/phone';

var LOGIN_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/login';

var USER_UPDATE_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/update';

var USER_DETAIL_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/getDetail';

var USER_TEAM_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/getTeam';

var USER_INCOME_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/getIncome';

var UPDATE_LOGIN_PWD_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/update_pwd';

var RESET_LOGIN_PWD_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/reset/password';

var UPDATE_PAY_PWD_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/update_jypwd';

var RESET_PAY_PWD_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/reset/jiaoyimima';

var LOGOUT_URL = BASE_URL + MODULE_WEB+ '/api/shopuser/login_out';

var HOLDER_PROFIT_URL = BASE_URL + MODULE_WEB + '/api/shoptrade/listProfit';

var SHOPBILL_TRANSFER = BASE_URL + MODULE_WEB + '/api/shopbilltrade/transfer';

var SHOPBILL_CHANGE = BASE_URL + MODULE_WEB + '/api/shopbilltrade/change';

var LOGIN_ERR_MSG = 'login first'

var BANNER_COLUMN_ID = '8a2a08425b7a0b7b015b7a2b0f060006'

var ARTICLE_COLUMN_ID = '8a2a08425b7aa230015b7aa9a1ad0004'

var HEART_COLUMN_ID = '2c92d39667356dfc016735f691700000'

var HEALTH_COLUMN_ID = '8a2a08425b7a0b7b015b7a9d0b2e000a'

var ARTICLE_ROOT_COLUMN_ID = '4028821e5b7a9cbf015b7a9f79e00000'

var HEART_ROOT_COLUMN_ID = '2c92d3966726e03001672eafcb4f0000'

var HEALTH_ROOT_COLUMN_ID = '8a2a08425b7a0b7b015b7a2a82ab0005'

var USER_LEVELS = {
    "v1": "无",
    "v2": "一级加盟店",
    "v3": "二级加盟店",
    "v4": "三级加盟店",
    "v5": "四级加盟店",
    "v6": "五级加盟店",
    "v7": "六级加盟店",
    "v8": "七级加盟店"
}
var LEVELS = {
		"t0": "普通会员",
		"t1": "黄金会员",
		"t2": "铂金会员",
		"t3": "钻石会员"
}

var USER_PRICE = {
    'v0': 'price1',
    'v1': 'price1',
    'v2': 'price1',
    'v3': 'price1',
    'v4': 'price1',
    'v5': 'price1',
    'v6': 'price1',
    'v7': 'price1'
}

var INCOME = {
    '1': '购买商品',
    '2': '复购产品收益',
    '3': '赠送兑换积分',
    '4': '间推收益',
    '5': '加盟店奖励',
    '6': '股权收益',
    '7': '共享收益',
    '8': '捐赠',
    '9': '赠送积分',
    '10': '一级销售奖',
    '11': '二级销售奖',
    '12': '提现健康值',
    '13': '项目合作收益',
    '14': '余额提现',
    '15': '余额充值',
    '16': '转账收入',
    '17': '转账付款'
}

var BILL_TYPES = {
    '1': '提现',
    '2': '转让',
    '3': '捐赠'
}

var BILL_STATUS = {
    '1': '待审核',
    '2': '已完成'
}

var ORDER_TYPES = {
    '1': '购买商品',
    '2': '复购产品',
    '13': '项目合作'
}

var ORDER_STATUS = {
    '1': '待发货',
    '2': '已发货',
    '3': '已确认收货'
}

function timestampToDatetime(value) {
    if (value === undefined || value === null || value === '') {
        return '-';
    } else {
        var currDate = new Date(value);
        var year = currDate.getFullYear();
        var month = currDate.getMonth() + 1;
        var day = currDate.getDate();
        var hour = currDate.getHours();
        var minute = currDate.getMinutes();
        var second = currDate.getSeconds();
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;
        hour = hour < 10 ? '0' + hour : hour;
        minute = minute < 10 ? '0' + minute : minute;
        second = second < 10 ? '0' + second : second;
        return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
    }
}

function isPhone(phone) {
    var phoneExp = /^[1][3,4,5,7,8,9][0-9]{9}$/;
    return phoneExp.test(phone);
}

function scrollToId(id) {
    $("html,body").animate({scrollTop:$("#" + id).offset().top}, 800);
}
