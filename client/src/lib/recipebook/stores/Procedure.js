import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/procedures";

export const procedures = writable([]);

const crud = getCrudApi(url, procedures)
export const getAllProcedures = crud.getAll;
export const postProcedure = crud.post;
export const updateProcedure = crud.update;
export const deleteProcedure = crud.delete;

