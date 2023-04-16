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
	make initorder; make inituser; make initreply; make initrecommend;  make initproduct; make initpay; make initcart;

genbff:
	cd apps/app/api && goctl api go -api api.api -dir .

genorderrpc:
	cd apps/order/rpc && goctl rpc protoc order.proto --go_out=. --go-grpc_out=. --zrpc_out=.

genproductrpc:
	cd apps/product/rpc && goctl rpc protoc product.proto --go_out=. --go-grpc_out=. --zrpc_out=.

startorder:
	cd apps/order/rpc && go run order.go

clean:
	rm -rf apps/order/* && rm -rf apps/cart/* && rm -rf apps/pay/* && rm -rf apps/product/* && rm -rf apps/recommend/* && rm -rf apps/reply/* && rm -rf apps/user/*

etcd:
	docker run -d --name Etcd-server \
        --publish 2379:2379 \
        --publish 2380:2380 \
        --env ALLOW_NONE_AUTHENTICATION=yes \
        --env ETCD_ADVERTISE_CLIENT_URLS=http://etcd-server:2379 \
        bitnami/etcd:latest

.PHONY: genproductrpc etcd clean genorderrpc startorder initorder initapi inituser initreply initrecommend initproduct initpay initcart init genbff