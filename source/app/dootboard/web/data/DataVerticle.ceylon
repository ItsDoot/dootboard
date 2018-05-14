import io.vertx.ceylon.core {
    Verticle,
    Future
}
shared class DataVerticle() extends Verticle() {

    shared actual void startAsync(Future<Anything> startFuture) {
        vertx.eventBus().consumer<String>("api.servers.get", (msg) {
            if (exists id = msg.body()) {
                
            }
        });

        startFuture.complete();
    }
}