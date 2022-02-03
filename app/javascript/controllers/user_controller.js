import {Controller, fetch} from "@hotwired/stimulus"

export default class extends Controller {

    /**
     * Basic route for send all data
     *
     * @type {string}
     */
    ROUTE = '/users'

    /**
     * Id of selector for replace fetched content
     *
     * @type {string}
     */
    REPLACE_ID = 'fetch-user-form'

    connect() {
        this.element.textContent = "Hello World!"
    }

    /**
     * Send data to controller for get content
     *
     * @param {String} path
     * @param {String} method
     * @returns {Promise<void>}
     * @private
     */
    async _fetchData(path, method = 'GET') {
        const response = fetch(path, {
                'method': method,
                mode: 'cors', // no-cors, *cors, same-origin
                cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
                credentials: 'same-origin', // include, *same-origin, omit
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                redirect: 'follow', // manual, *follow, error
                referrerPolicy: 'no-referrer', // no-referrer, *client
            }
        )

        return await response.json()
    }

    update() {

    }

}
