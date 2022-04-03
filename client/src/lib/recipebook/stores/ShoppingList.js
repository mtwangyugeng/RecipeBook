import {writable} from 'svelte/store'
import {getCrudApi} from "./_CrudHelper.js"

const url = "/api/list_items";
export const listItems = writable([]);
let temp;
listItems.subscribe(v=>temp=v)

const crud = getCrudApi(url, listItems)

export const getAllListItems = crud.getAll;

export const add = function (ingredient_id, add_amount=1) {
        let i = temp.findIndex(v => v.ingredient_id === ingredient_id);
       
        if (i!=-1){
            const res = temp[i]
            res["amount"] += add_amount
            let id= res["id"]
            crud.update(id, res)
        } else{
            crud.post({
                ingredient_id:ingredient_id, 
                amount: add_amount
            })
        }
}

export const minus = function (ingredient_id) {
    let i = temp.findIndex(v => v.ingredient_id === ingredient_id);
    if (i!=-1){
        const res = temp[i]
        let id= res["id"]
        if (res["amount"] <= 1 || !res["amount"] ){
            res.splice(i, 1);
            crud.delete(id)
        }else{
            res["amount"] -= 1
            crud.update(id, res)
        }
    }
}


//init