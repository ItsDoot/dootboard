import pw.dotdash.adapt.jooq.codegen {
    generator,
    configuration,
    jdbc,
    database,
    target,
    strategy,
    customType,
    forcedType
}

shared void run() {
    value conf = configuration {
        generator {
            name = "org.jooq.util.DefaultGenerator";
            strategy = strategy {
                name = "pw.dotdash.adapt.jooq.codegen.CeylonicGeneratorStrategy";
            };
            database = database {
                name = "org.jooq.util.postgres.PostgresDatabase";
                inputSchema = "dootboard";
                customTypes = [customType {
                    name = "CeylonString";
                    type = "ceylon.language.String";
                    converter = "pw.dotdash.adapt.jooq.codegen.StringConverter";
                },
                    customType {
                        name = "CeylonInteger";
                        type = "ceylon.language.Integer";
                        converter = "pw.dotdash.adapt.jooq.codegen.IntegerConverter";
                    },
                    customType {
                        name = "CeylonFloat";
                        type = "ceylon.language.Float";
                        converter = "pw.dotdash.adapt.jooq.codegen.FloatConverter";
                    },
                    customType {
                        name = "CeylonBoolean";
                        type = "ceylon.language.Boolean";
                        converter = "pw.dotdash.adapt.jooq.codegen.BooleanConverter";
                    },
                    customType {
                        name = "CeylonDateTime";
                        type = "ceylon.time.DateTime";
                        converter = "pw.dotdash.adapt.jooq.codegen.DateTimeConverter";
                    }];
                forcedTypes = [forcedType {
                    name = "CeylonString";
                    types = "varchar|text";
                },
                    forcedType {
                        name = "CeylonInteger";
                        types = "int|integer";
                    },
                    forcedType {
                        name = "CeylonFloat";
                        types = "float";
                    },
                    forcedType {
                        name = "CeylonBoolean";
                        types = "bool|boolean";
                    },
                    forcedType {
                        name = "CeylonDateTime";
                        types = "timestamp";
                    }];
            };
            target = target {
                packageName = "gen.app.dootboard.web.data.sql";
                directory = "./source";
            };
        };
        jdbc {
            url = "jdbc:postgresql://localhost:5432/";
            driver = "org.postgresql.Driver";
            username = "";
            password = "";
        };
    };

    Gen.gen(conf);
}
