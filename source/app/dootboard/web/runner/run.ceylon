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
    vertx_=vertx
}
import io.vertx.ceylon.web {
    router_=router
}

import app.dootboard.web.api.service {
    RoutingService
}

Logger logger = createLogger(`module`);

shared void run() {
    addLogWriter(writeSimpleLog);
    defaultPriority = trace;

    value vertx = vertx_.vertx();
    value router = router_.router(vertx);

    for (routing in `module`.findServiceProviders(`RoutingService`)) {
        logger.info("RoutingService | Loaded ``type(routing)``");
        routing.register(router);
    }
}