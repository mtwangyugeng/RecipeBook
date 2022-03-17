import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/ingredients";

export const ingredients = writable([]);

const crud = getCrudApi(url, ingredients)
export const getAllIngredients = crud.getAll;
export const postIngredient = crud.post;
export const updateIngredient = crud.update;
export const deleteIngredient = crud.delete;