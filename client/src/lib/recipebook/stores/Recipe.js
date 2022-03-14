import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/recipes";

export const recipes = writable([]);
export const recipesCrud = getCrudApi(url, recipes)
