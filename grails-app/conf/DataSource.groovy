dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
//            url = "jdbc:hsqldb:mem:devDB"

            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/grails"
            driverClassName = "org.postgresql.Driver"
            username = ""
            password = ""
            dialect = "org.hibernatespatial.postgis.PostgisDialect"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:hsqldb:mem:testDb"

            url = "jdbc:postgresql://localhost:5432/grails"
            driverClassName = "org.postgresql.Driver"
            username = ""
            password = ""
            dialect = "org.hibernatespatial.postgis.PostgisDialect"
        }
    }
    production {
        dataSource {
            dbCreate = "update"

            // Config for PostgreSQL/PostGIS
            url = "jdbc:postgresql://localhost:5432/grails"
            driverClassName = "org.postgresql.Driver"
            username = ""
            password = ""
//            dialect = "org.hibernate.dialect.PostgreSQLDialect"
            dialect = "org.hibernatespatial.postgis.PostgisDialect"

            // Old config for MySQL
//            driverClassName = "com.mysql.jdbc.Driver"
//            url = "jdbc:mysql://localhost/archaeology"
//            username = ""
//            password = ""

            // Old config for HSQLDB
//            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}
