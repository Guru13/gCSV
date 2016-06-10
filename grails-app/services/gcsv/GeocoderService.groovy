package gcsv

import by.guru13.Client
import grails.transaction.Transactional

@Transactional
class GeocoderService {

    void fillInLatLng(Client client) {
        String base = 'https://maps.googleapis.com/maps/api/geocode/xml?'
        String encoded = [client.street, client.zip].collect {
            URLEncoder.encode(it, 'UTF-8')
        }.join(',')
        String qs = "address=$encoded"
        def root = new XmlSlurper().parse("$base$qs")
        def location = root.result[0].geometry.location

            client.latitude = location.lat.toDouble()
            client.longitude = location.lng.toDouble()

    }
}
