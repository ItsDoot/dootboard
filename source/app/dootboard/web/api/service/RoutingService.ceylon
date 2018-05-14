import io.vertx.ceylon.web {
    Router
}

"Acts as loose coupling for the creation of HTTP routes."
shared interface RoutingService {

    shared formal void register(Router root) ;
}