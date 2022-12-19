import { Controller } from "@hotwired/stimulus"
import Beautify from "json-format-highlight"
export default class extends Controller {
    static targets = [ "payloadJson" ]
    connect() {
        var beauty = Beautify(this.payloadJsonTarget.dataset.actualJson)
        console.log(beauty)
        this.payloadJsonTarget.innerHTML = beauty
    }
}
