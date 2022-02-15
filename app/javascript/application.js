// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require_tree .

import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"


const survey = () => {
    console.log('Load survey functions');

    const KEY = '[survey][options]';

    const buttonAddSurveysOptions = document.getElementById('add-new-option-field');

    if (!buttonAddSurveysOptions) {
        return;
    }

    const group = (count) => {
        const id = `options${count}`;
        const div = document.createElement('div');
        div.classList.add('form-group');

        const label = document.createElement('label');
        label.setAttribute('for', id);
        label.innerText = `Question #${count};`;
        label.classList.add('form-label');


        const input = document.createElement('input');
        input.setAttribute('id', id);
        input.setAttribute('type', 'text')
        input.setAttribute('name', `${KEY}[]`);
        input.classList.add('form-control', 'form-control-lg');

        div.append(label, input);

        return div;
    };

    buttonAddSurveysOptions.addEventListener('click', () => {
        console.log('Click on plus');
        const container = document.querySelector('.survey-options');

        const count = +container.querySelectorAll('.form-group').length;
        console.log(count);

        container.prepend(group(count));
    });

}

document.addEventListener('DOMContentLoaded', () => {
    console.log('DOMContentLoaded');


    survey();


});

