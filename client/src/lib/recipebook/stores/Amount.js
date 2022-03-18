import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/amounts";

export const amounts = writable([]);

const crud = getCrudApi(url, amounts)
export const getAllAmounts = crud.getAll;
export const postAmount = crud.post;
export const updateAmount = crud.update;
export const deleteAmount = crud.delete;