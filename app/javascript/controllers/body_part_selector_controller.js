// import { Controller } from 'stimulus'

// export default class extends Controller {
//   initialize() {
//     console.log("Hello from body-part-selector controller!")
//   }

//   body_part_changed() {
//     var that = this
//     for (let i = 0; i < that.count.options.length; i++) {
//       that..options[i] = null;
//     }
//   }

//   get body_part() {
//     return this.targets.find('body_part_input')
//   }

//   get productable_url() {
//     return this.body_part.selectedOptions[0].getAttribute('url')
//   }

//   request_data(url, callback) {
//     Rails.ajax({
//       type: 'GET',
//       url: url,
//       success: callback,
//       error: function (response) {}
//     })
//   }

// }
