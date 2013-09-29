grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
		grailsRepo "http://grails.org/plugins"
        //grailsPlugins()
        grailsHome()
        grailsCentral()

        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        //mavenLocal()
        mavenCentral()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        //runtime 'mysql:mysql-connector-java:5.1.13'
        runtime 'postgresql:postgresql:8.4-702.jdbc4'
        compile("joda-time:joda-time-hibernate:1.2") {
            excludes "joda-time", "hibernate"
        }
        runtime 'com.itextpdf:itextpdf:5.0.6'

        // Additional dependencies to be put in lib directory
        //
        // hibernate-spatial-1.0.jar
        // hibernate-spatial-postgis-1.0.jar
        // jts-1.8.jar
        // postgis-2.0.0SVN.jar
    }
}
