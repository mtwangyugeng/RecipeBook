import {writable} from 'svelte/store'

export const listItems = writable([]);


export const getAllListItems = () => {
    listItems.set([
        {
            id: 1,
            ingredient_id: 1,
            ingredient_amount: 2
            //created_at;
            //updated_at;
        },
        {
            id: 2,
            ingredient_id: 2,
            ingredient_amount: 3
            //created_at;
            //updated_at;
        }
    ]);
    return 200;
};


let tempId = 3
export const add = function (ingredient_id) {
    listItems.update(prev => {
        let i = prev.findIndex(v => v.ingredient_id === ingredient_id);
        if (i!=-1){
            const res = [...prev]
            res[i]["ingredient_amount"] += 1
            return res
        } else{
            return [...prev, {
                id:tempId++, 
                ingredient_id:ingredient_id, 
                ingredient_amount: 1
            }]
        }
    })
}

export const updateShoppingList = (id, impJson, token) => {
    listItems.update(prev => {
        let i = prev.findIndex(v => v.id === id);
        const res = [...prev]
        res[i] = impJson
        return res
    })
    return 202;
};


export const postShoppingList = (impJson, token) => {

    listItems.update(prev => {
        const res = [...prev, impJson]
        return res
    })
    return 201;
};


export const deleteShoppingList = (id, token) => {
    listItems.update(prev => {
        const res = prev.filter(v => v.id !== id)
        return res
    })
    return 303
}


//init
getAllListItems();