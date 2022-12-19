import { Controller } from "@hotwired/stimulus"
import { prettyPrintJson } from 'pretty-print-json';
export default class extends Controller {
    static targets = [ "payloadJson" ]
    connect() {
        console.log(this.payloadJsonTarget.dataset.actualJson)
        // const html = prettyPrintJson.toHtml(data);
    }
}

// https://www.npmjs.com/package/json-beautify