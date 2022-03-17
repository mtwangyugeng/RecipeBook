import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/recipes";
//recipe: {title: string}
export const recipes = writable([]);

const crud = getCrudApi(url, recipes)
export const getAllRecipes = crud.getAll;
export const postRecipe = crud.post;
export const updateRecipe = crud.update;
export const deleteRecipe = crud.delete;