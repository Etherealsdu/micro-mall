initorder:
	cd apps/order && goctl rpc new rpc && goctl api new admin

initapi:
	cd apps/app && goctl api new api

initcart:
	cd apps/cart && goctl rpc new rpc && goctl api new admin

initpay:
	cd apps/pay && goctl rpc new rpc && goctl api new admin

initproduct:
	cd apps/product && goctl rpc new rpc && goctl api new admin

initrecommend:
	cd apps/recommend && goctl rpc new rpc

initreply:
	cd apps/reply && goctl rpc new rpc && goctl api new admin

inituser:
	cd apps/user && goctl rpc new rpc && goctl api new admin

init:
	make initorder; make initapi; make inituser; make initreply; make initrecommend;  make initproduct; make initpay; make initcart;

.PHONY: initorder initapi inituser initreply initrecommend initproduct initpay initcart