import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/ingredients";

export const ingredients = writable([]);
export const ingredientsCrud = getCrudApi(url, ingredients)
