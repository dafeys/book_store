import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    if (typeof AdobeDC === "undefined") {
      console.error("Adobe DC View SDK not loaded");
      return;
    }

    const { url, filename } = this.element.dataset;
    const adobeDCView = new AdobeDC.View({
      clientId: "cc85a14cc9a0412fb114c9b6a489eb01",
      divId: "adobe-dc-view",
    });

    adobeDCView.previewFile({
      content: {
        location: { url },
      },
      metaData: {
        fileName: filename,
      },
    }, {
      showAnnotationTools: false,
      showDownloadPDF: false,
      showPrintPDF: false
    });
  }
}
