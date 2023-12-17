// app/javascript/controllers/upload_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['fileInput', 'uploadButton'];

    activateUploadButton() {
        if (this.fileInputTarget.value) {
            this.uploadButtonTarget.disabled = false;
        } else {
            this.uploadButtonTarget.disabled = true;
        }
    }
}
