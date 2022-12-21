import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
        this.element.classList.add("highlight");
        this.timeout = setTimeout(
            () => this.element.classList.remove("highlight"),
            3000
        );
    }

    disconnect() {
        clearTimeout(this.timeout);
    }
}