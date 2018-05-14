import ceylon.html {
    ...
}

import io.vertx.ceylon.web {
    Router
}
import io.vertx.ceylon.web.handler {
    staticHandler
}

import app.dootboard.web.core.html {
    newHead,
    newBody
}
import app.dootboard.web.core.service {
    RoutingService
}

service (`interface RoutingService`)
shared class CoreRoutingService() satisfies RoutingService {

    value html => Html {
        lang = "en";
        newHead {
        },
        newBody {
        }
    };

    shared actual void consume(Router root) {
        root.get("/home/").handler((ctx) {
            ctx.response().end(html.string);
        });

        root.route("/static/*").handler(staticHandler.create().handle);
    }
}