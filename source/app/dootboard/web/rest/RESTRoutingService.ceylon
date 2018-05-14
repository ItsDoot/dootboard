import ceylon.json {
    JsonObject
}

import io.vertx.ceylon.web {
    Router
}

import app.dootboard.web.api.service {
    RoutingService
}

service (`interface RoutingService`)
shared class RESTRoutingService() satisfies RoutingService {

    shared actual void register(Router root) {
        root.get("/api/servers/:id").handler((ctx) {
            ctx.vertx().eventBus().send<JsonObject>("api.servers.get", ctx.pathParam("id"), (reply) {
                if (is Throwable reply) {
                    ctx.fail(reply);
                    return;
                }

                if (exists body = reply.body()) {
                    ctx.response().end(body.string);
                } else {
                    ctx.response().setStatusCode(404).end();
                }
            });
        });
    }
}