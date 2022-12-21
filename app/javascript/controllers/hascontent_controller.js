import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
        let noEvents = document.getElementById('no-webhook-events-message') || false
        if(noEvents) {
            noEvents.remove()
        } 
    }
}