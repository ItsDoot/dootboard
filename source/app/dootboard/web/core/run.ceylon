import ceylon.language.meta {
    type
}
import ceylon.logging {
    addLogWriter,
    writeSimpleLog,
    defaultPriority,
    trace,
    Logger,
    createLogger=logger
}

import io.vertx.ceylon.core {
    vertx_=vertx,
    Verticle
}
import io.vertx.ceylon.core.http {
    HttpServer
}
import io.vertx.ceylon.web {
    router_=router
}

import app.dootboard.web.core.service {
    RoutingService
}

Logger logger = createLogger(`module`);

shared void run() {
    addLogWriter(writeSimpleLog);
    defaultPriority = trace;

    value vertx = vertx_.vertx();
    value router = router_.router(vertx);

    for (routing in `module`.findServiceProviders(`RoutingService`)) {
        logger.info("Found RoutingService: ``type(routing)``");
        routing.consume(router);
    }

    for (verticle in `module`.findServiceProviders(`Verticle`)) {
        logger.info("Found Verticle: ``type(verticle)``");
        verticle.deploy(vertx);
    }

    value server = vertx.createHttpServer().requestHandler(router.accept).listen(8080, "localhost", (result) {
        if (is HttpServer result) {
            logger.info("Server started. Listening on port ``result.actualPort()``.");
        } else {
            logger.error("Could not start server", result);
        }
    });
}