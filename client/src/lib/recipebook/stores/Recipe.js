import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/recipes";
//recipe: {title: string}
export const recipes = writable([]);
export const recipesCrud = getCrudApi(url, recipes)
