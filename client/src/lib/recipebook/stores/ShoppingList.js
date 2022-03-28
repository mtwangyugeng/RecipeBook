import {writable} from 'svelte/store'

export const listIngredients = writable({});

export const shoppingLists = writable([]);

export const getAllShoppingLists = () => {
    shoppingLists.set([
        {
            id: 1,
            name: "List A"
            //created_at;
            //updated_at;
        },
        {
            id: 2,
            name: "List B"
            //created_at;
            //updated_at;
        }
    ]);
    return 200;
};

export const updateShoppingList = (id, impJson, token) => {
    shoppingLists.update(prev => {
        let i = prev.findIndex(v => v.id === id);
        const res = [...prev]
        res[i] = impJson
        return res
    })
    return 202;
};


export const postShoppingList = (impJson, token) => {

    shoppingLists.update(prev => {
        const res = [...prev, impJson]
        return res
    })
    return 201;
};


export const deleteShoppingList = (id, token) => {
    shoppingLists.update(prev => {
        const res = prev.filter(v => v.id !== id)
        return res
    })
    return 303
}