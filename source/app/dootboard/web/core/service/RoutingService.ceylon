import io.vertx.ceylon.web {
    Router
}

shared interface RoutingService {

    shared formal void consume(Router root) ;
}