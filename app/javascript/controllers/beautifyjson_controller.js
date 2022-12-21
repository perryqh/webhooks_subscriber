import { Controller } from "@hotwired/stimulus"
import Beautify from "json-format-highlight"
export default class extends Controller {
    static targets = [ "payloadJson" ]
    connect() {
        const customColorOptions = {
            keyColor: 'black',
            numberColor: 'blue',
            stringColor: '#0B7500',
            trueColor: '#00cc00',
            falseColor: '#ff8080',
            nullColor: 'cornflowerblue'
        };
        const json = this.payloadJsonTarget.dataset.actualJson
        this.payloadJsonTarget.innerHTML = Beautify(json, customColorOptions)
    }
}
