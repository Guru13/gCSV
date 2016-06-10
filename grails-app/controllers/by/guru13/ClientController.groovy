package by.guru13

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('IS_AUTHENTICATED_FULLY')
class ClientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def geocoderService


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model: [clientInstanceCount: Client.count()]

    }

    def show(Client clientInstance) {
        geocoderService.fillInLatLng(clientInstance)
        respond clientInstance
    }

    def create() {
        respond new Client(params)
    }

    @Transactional
    def save(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        geocoderService.fillInLatLng(clientInstance)

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view: 'create'
            return
        }

        clientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: CREATED] }
        }
    }

    def edit(Client clientInstance) {
//        geocoderService.fillInLatLng(clientInstance)
        respond clientInstance
    }

    @Transactional
    def update(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }
//        geocoderService.fillInLatLng(clientInstance)
        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view: 'edit'
            return
        }

        clientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Client clientInstance) {

        if (clientInstance == null) {
            notFound()
            return
        }

        clientInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def upload() {

    }

    def doUpload() {
        request.getFile('file')
                .inputStream
                .splitEachLine(',') { fields ->
            def client = new Client(
                    name: fields[0],
                    email: fields[1],
                    street: fields[2],
                    zip: fields[3]
            )
            geocoderService.fillInLatLng(client)
            if (client.hasErrors() || client.save(flush: true) == null) {
                log.error("Could not import domainObject  ${client.errors}")
            }

            log.debug("Importing domainObject  ${client.toString()}")
        }

        redirect(action: 'index')
    }

    def search() {

    }

    def listClients() {

        def name = params.clientName
        def street = params.clientStreet
        def email = params.clientEmail
        def zip = params.clientZip

        def results

        if (name) {
            results = Client.where {
                name == name
            }
        } else if (email) {
            results = Client.where {
                email == email
            }
        } else if (street) {
            results = Client.where {
                street == street
            }
        } else if (zip) {
            results = Client.where {
                zip == zip
            }
        }
        return [clients: results]
    }
}
