native ("jvm")
module gen.app.dootboard.web.data "1.0.0" {
    value jooqVersion = "3.10.7";
    shared import java.base "8";

    shared import ceylon.interop.java "1.3.3";

    shared import maven:"org.jooq:jooq" jooqVersion;
    shared import maven:"org.jooq:jooq-meta" jooqVersion;
    shared import maven:"org.jooq:jooq-codegen" jooqVersion;
    shared import pw.dotdash.adapt.jooq.codegen jooqVersion;

    shared import maven:"org.postgresql:postgresql" "42.2.2";
}