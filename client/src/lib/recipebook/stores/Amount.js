import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/amounts";

export const amounts = writable([]);
export const recipesCrud = getCrudApi(url, amounts)
