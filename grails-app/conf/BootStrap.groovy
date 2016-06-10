import by.guru13.*
class BootStrap {

    def init = { servletContext ->
        def userRole = new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def userUser = new User(username: 'user', password: 'user', enabled: true).save(failOnError: true)
        def adminUser = new User(username: 'admin', password: 'admin', enabled: true).save(failOnError: true)

        UserRole.create userUser, userRole
        UserRole.create adminUser, adminRole
    }
    def destroy = {
    }
}
