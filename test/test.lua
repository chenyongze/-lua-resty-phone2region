--get请求接口
--http://127.0.0.1/file/phone?mobile=13955662378

ngx.header["X-Server-By"] = 'yongze.chen'
ngx.header['Content-Type']="text/html;charset=UTF-8"
local phone2region = require 'lib.resty.phone2region.location'
local location = phone2region:new({dict = 'phone_data', root = '/the/path/to/lua-resty-phone2region'})
local cjson = require("cjson")
local uri_args = ngx.req.get_uri_args()
local mobile = uri_args.mobile or 18514823010
local tab, err = location:bin_search(mobile)

if tab then
    ngx.say(cjson.encode(tab))
else
    ngx.say(err)
end
